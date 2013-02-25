//
//  YCAutoServiceOrderFormViewController.m
//  yangcheApp
//
//  Created by Pharaoh on 13-2-22.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import "YCAutoServiceOrderFormViewController.h"
#import "YCAutoServiceDetailViewController.h"
#import "YCMocManager.h"
#import "AutoService.h"
#import "YCOrderFormInputAccessoryToolbar.h"
@interface YCAutoServiceOrderFormViewController (){
	YCMocManager* mocManager;
	AutoService* autoService;
	YCOrderFormInputAccessoryToolbar* accessoryToolbar;
	UIDatePicker* appointmentDate;
	UIPickerView* carInfoPicker;
	UIPickerView* pointsPicker;
	NSDictionary* carInfoDic;
	NSInteger currentSelectedBrandIndex;
	NSArray* keys;
	NSArray* pointsArr;
}

@end

@implementation YCAutoServiceOrderFormViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
	

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

	// DAO服务
	mocManager = [[YCMocManager alloc] init];
	// 根据manageObject的全局URL获取该数据对象
	autoService = [mocManager fetchByURI:self.moURI];
	
	// 输入键盘操作栏
	accessoryToolbar = [[YCOrderFormInputAccessoryToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44.0)];
	// 
	accessoryToolbar.currentFocusFieldIndex = 1000;
	[accessoryToolbar.prevBtn addTarget:self action:@selector(prevBtnAction) forControlEvents:UIControlEventTouchUpInside];
	[accessoryToolbar.nextBtn addTarget:self action:@selector(nextBtnAction) forControlEvents:UIControlEventTouchUpInside];
	[accessoryToolbar.closeKeybord addTarget:self action:@selector(hideKeyboard) forControlEvents:UIControlEventTouchUpInside];
	
	// 联系方式
	self.orderFormContactField.inputAccessoryView = accessoryToolbar;
	// 联系人姓名
	self.orderFormNameField.inputAccessoryView = accessoryToolbar;
	// 预约时间
	self.orderFormAppointmentField.inputAccessoryView = accessoryToolbar;
	// 初始化一个时间选择器出来
	appointmentDate = [[UIDatePicker alloc] init];
	[appointmentDate setMinuteInterval:30];
	[appointmentDate addTarget:self action:@selector(pickADate:) forControlEvents:UIControlEventValueChanged];
	// 选择时间
	self.orderFormAppointmentField.inputView = appointmentDate;
	// 邮件信息
	self.orderFormEmailOptionField.inputAccessoryView = accessoryToolbar;
	// 车辆类型
	carInfoDic = @{@"大众": @[@"桑塔纳",@"帕萨特",@"速腾",@"高尔夫",@"捷达",@"POLO"],@"奥迪":@[@"A4L",@"Q7",@"R8",@"TT"],@"福特":@[@"福克斯三厢",@"蒙迪欧",@"翼虎"]};
	keys = [carInfoDic allKeys];
	currentSelectedBrandIndex = 0;	
	self.orderFormCarInfoOptionField.inputAccessoryView = accessoryToolbar;
	// 初始化一个类型选择器
	carInfoPicker = [[UIPickerView alloc] init];
	carInfoPicker.delegate = self;
	carInfoPicker.dataSource = self;
	carInfoPicker.showsSelectionIndicator = YES;
	self.orderFormCarInfoOptionField.inputView = carInfoPicker;
	
	// 抵用积分
	self.orderFormPointsOptionField.inputAccessoryView = accessoryToolbar;
	// 初始化一个积分选择器
	pointsPicker = [[UIPickerView alloc] init];
	pointsPicker.delegate = self;
	pointsPicker.showsSelectionIndicator = YES;
	self.orderFormPointsOptionField.inputView = pointsPicker;
	// 初始化积分列表
	[self pointsArrayMake:100];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
	accessoryToolbar = nil;
	autoService = nil;
	mocManager = nil;
}


# pragma mark - utils
- (void) pointsArrayMake:(NSInteger)points{
	if (points<0) {
		pointsArr= @[@"0"];
	}else{
		NSMutableArray* pointsStack = [NSMutableArray arrayWithArray:@[@"0"]];
		NSInteger index = 1;
		while (index<=points) {
			[pointsStack addObject:[NSString stringWithFormat:@"%i",index]];
			index++;
		}
		pointsArr = [pointsStack copy];
	}
}

# pragma mark - action
// 每次改变时间选择.都会反映到输入框中
- (void)pickADate:(UIDatePicker*)sender{
	NSDateFormatter* formater = [[NSDateFormatter alloc] init];
	[formater setDateFormat:@"MM-dd-YYYY HH:mm"];
	[self.orderFormAppointmentField setText:[formater stringFromDate:sender.date]];
	
}


- (void) hideKeyboard{
	NSLog(@"%i",accessoryToolbar.currentFocusFieldIndex);
	[[self.view viewWithTag:accessoryToolbar.currentFocusFieldIndex] resignFirstResponder] ;
}

- (void) nextBtnAction {
	if (accessoryToolbar.currentFocusFieldIndex+1 > 1005) {
		return;
	}
	[[self.view viewWithTag:accessoryToolbar.currentFocusFieldIndex+1] becomeFirstResponder];
}

- (void) prevBtnAction {
	if (accessoryToolbar.currentFocusFieldIndex-1 < 1000) {
		return;
	}
	[[self.view viewWithTag:accessoryToolbar.currentFocusFieldIndex-1] becomeFirstResponder];
}

#pragma mark - picker datasorce
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
	if (pickerView == carInfoPicker) {
		return 2;
	}else{
		return 1;
	}
	
	
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
	
	if (pickerView == carInfoPicker) {
		if (component == 0) {
			return [keys count];
		}else if (component == 1){
			return [[carInfoDic valueForKey:keys[currentSelectedBrandIndex]] count];
		}else{
			return 0;
		}
	}else{
		return [pointsArr count];
		
	}
}
	

#pragma mark - picker delegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
	NSArray* titleArr = nil;
	if (pickerView == carInfoPicker) {
		
		if (component == 0) {
			titleArr = keys;
		}else if (component == 1){
			titleArr = [carInfoDic valueForKey:keys[currentSelectedBrandIndex]];
			
		}
		
		return titleArr[row];

	}else{
		return pointsArr[row];
	}
		
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
	if (pickerView == carInfoPicker) {
		NSInteger seriesIndex = 0;
		if (component == 0) {
			currentSelectedBrandIndex = row;
			[pickerView reloadComponent:1];
			
			seriesIndex = [pickerView selectedRowInComponent:1];
		}else{
			seriesIndex = row;
		}
		self.orderFormCarInfoOptionField.text = [[keys[currentSelectedBrandIndex] description] stringByAppendingFormat:@" %@",[[carInfoDic valueForKey:keys[currentSelectedBrandIndex]][seriesIndex] description]] ;
	}else{
		self.orderFormPointsOptionField.text = pointsArr[row];
	}
	
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 3;
    
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

#pragma textfield delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == self.orderFormContactField) {
        [self.orderFormContactField resignFirstResponder];
    }
    if (textField == self.orderFormNameField) {
        [self.orderFormNameField resignFirstResponder];
    }
	if (textField == self.orderFormAppointmentField) {
		[self.orderFormAppointmentField resignFirstResponder];
	}
    if (textField == self.orderFormEmailOptionField) {
        [self.orderFormEmailOptionField resignFirstResponder];
    }
    
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
	accessoryToolbar.currentFocusFieldIndex = textField.tag;
	return YES;
}

# pragma mark - segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
	if([segue.identifier isEqualToString:@"backToServiceDetailFromOrderForm"]){
		YCAutoServiceDetailViewController* detailViewController = [segue destinationViewController];
		detailViewController.moURI = [[autoService objectID] URIRepresentation];
	}
}


@end
