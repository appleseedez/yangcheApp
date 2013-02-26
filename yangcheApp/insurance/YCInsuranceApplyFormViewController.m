//
//  YCInsuranceApplyFormViewController.m
//  yangcheApp
//
//  Created by Pharaoh on 13-2-26.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import "YCInsuranceApplyFormViewController.h"
#import "YCOrderFormInputAccessoryToolbar.h"
@interface YCInsuranceApplyFormViewController (){
	YCOrderFormInputAccessoryToolbar* accessoryToolbar;
}

@end

@implementation YCInsuranceApplyFormViewController

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
	// 输入键盘操作栏
	accessoryToolbar = [[YCOrderFormInputAccessoryToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44.0)];
	accessoryToolbar.currentFocusFieldIndex = 1000;
	[accessoryToolbar.prevBtn addTarget:self action:@selector(prevBtnAction) forControlEvents:UIControlEventTouchUpInside];
	[accessoryToolbar.nextBtn addTarget:self action:@selector(nextBtnAction) forControlEvents:UIControlEventTouchUpInside];
	[accessoryToolbar.closeKeybord addTarget:self action:@selector(hideKeyboard) forControlEvents:UIControlEventTouchUpInside];
	// 联系方式
	self.applyFormContactField.inputAccessoryView = accessoryToolbar;
	//联系人姓名
	self.appyFormNameField.inputAccessoryView = accessoryToolbar;
	//车牌号码
	self.applyFormCarIdField.inputAccessoryView = accessoryToolbar;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


# pragma mark - action
- (void) hideKeyboard{
	
	[[self.view viewWithTag:accessoryToolbar.currentFocusFieldIndex] resignFirstResponder] ;
}

- (void) nextBtnAction {
	if (accessoryToolbar.currentFocusFieldIndex+1 > 1003) {
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

#pragma mark - textfield delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
	accessoryToolbar.currentFocusFieldIndex = textField.tag;
	return YES;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return 3;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    
//    // Configure the cell...
//    
//    return cell;
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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

@end
