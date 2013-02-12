//
//  YCAutoServiceDetailViewController.m
//  yangcheApp
//
//  Created by Pharaoh on 13-1-14.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "YCAutoServiceDetailViewController.h"
#import "YCAutoServiceMetaCell.h"
#import "YCMocManager.h"
#import "YCImageScrollerCell.h"
#import "YCAutoServiceShopIndexCell.h"
#import "YCMocManager.h"
#import "UIImageView+AFNetworking.h"
#import "AutoService.h"
#import "YCAutoServiceShopDetailViewController.h"
#import "YCMapViewController.h"
#import "YCCommentsViewController.h"

@interface YCAutoServiceDetailViewController (){
	YCMocManager* mocManager;
	AutoService* autoService;
}

@property(nonatomic) CGSize describeConentSize; // 将服务描述单元格的高度保存.
@property (weak, nonatomic) IBOutlet UIToolbar *autoServiceToolbar;
@end

@implementation YCAutoServiceDetailViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	
	// 工具条背景图片为黑色
	[[UIToolbar appearance] setBackgroundImage:[UIImage imageNamed:@"nav_bg"] forToolbarPosition:UIToolbarPositionBottom barMetrics:UIBarMetricsDefault];
	// DAO服务
	mocManager = [[YCMocManager alloc] init];
	// 根据manageObject的全局URL获取该数据对象
	autoService = [mocManager fetchByURI:self.moURI];
	
	// 收藏红心状态
	if ([autoService.is_fav boolValue]) {
		[self.favBtnView setImage:[UIImage imageNamed:@"red-heart"] forState:UIControlStateNormal];
	}else{		
		[self.favBtnView setImage:[UIImage imageNamed:@"29-heart"] forState:UIControlStateNormal];
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - segue 

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
	if ([segue.identifier isEqualToString:@"showOnMap"]) {
		YCMapViewController* mapViewController = [segue destinationViewController];
		mapViewController.moURI = [[autoService objectID] URIRepresentation];
	}else if ([segue.identifier isEqualToString:@"showShopDetail"]){
		YCAutoServiceShopDetailViewController* shopDetailViewController = [segue destinationViewController];
		shopDetailViewController.moURI = [[autoService objectID] URIRepresentation];
	}else if ([segue.identifier isEqualToString:@"showComments"]){
		YCCommentsViewController* commentsViewController = [segue destinationViewController];
		commentsViewController.moURI = [[autoService objectID] URIRepresentation];
	}
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //一共就只有三个单元格
    return 3;
}
#define CELL_CONTENT_MARGIN 10.0
#define CELL_CONTENT_WIDTH 320.0
#define FONT_SIZE 12.0
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	//UITableViewCell* cell = nil;

	if (indexPath.row == 0) {
		YCImageScrollerCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ShowCaseCell"];
		if (nil == cell) {
			cell = [[YCImageScrollerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ShowCaseCell"];
		}
		return cell;
	}else if(indexPath.row == 1){
		YCAutoServiceMetaCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ServiceMetaCell"];
		if (nil == cell) {
			cell = [[YCAutoServiceMetaCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ServiceMetaCell"];
		}
		cell.nameView.text = autoService.name;
		cell.uvView.text =autoService.uv;
		cell.priceView.text = [NSString stringWithFormat:@"$ %@",autoService.price];
		
		NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
		[formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
		cell.updateTimeView.text =  [formatter stringFromDate:autoService.update_time];
		cell.addressView.text =autoService.address;
		return cell;
	}else if(indexPath.row == 2){
			
		UILabel* textConent = nil; // 放文本
		
		UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ServiceDescriptionCell"];

		if (nil == cell) {
			cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ServiceDescriptionCell"];
		}
		textConent = [[UILabel alloc] initWithFrame:CGRectZero];
		[textConent setLineBreakMode:NSLineBreakByCharWrapping];
		[textConent setFont:[UIFont systemFontOfSize:FONT_SIZE]];
		[textConent setNumberOfLines:0];
		[textConent setTag:2];
		[[cell contentView ] addSubview:textConent];
	
		if (!textConent) {
			textConent = (UILabel*)[cell viewWithTag:2];
		}
		[textConent setText:autoService.service_info];

		// 确定内容框的位置
		[textConent setFrame:CGRectMake(CELL_CONTENT_MARGIN, CELL_CONTENT_MARGIN, CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), self.describeConentSize.height)];
		return cell;
		
	}else {
		
		UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
		if (nil==cell) {
			cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
		}
		return cell;
	}
    
    
    // Configure the cell...
    
    
}
//  将服务所属店铺作为header
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	static NSString *CellIdentifier = @"ShopIndexCell";

    YCAutoServiceShopIndexCell *headerView = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (headerView == nil){
		headerView = [[YCAutoServiceShopIndexCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
	
	CALayer* topBorder = [CALayer layer];
	topBorder.frame = CGRectMake(0, -1, self.view.frame.size.width, 1.0);
	topBorder.backgroundColor = [UIColor lightGrayColor].CGColor;
	[headerView.layer addSublayer:topBorder];
	headerView.nameView.text = [autoService valueForKeyPath:@"shop.name"];
	[headerView.thumbView setImageWithURL:[NSURL URLWithString:autoService.thumb] placeholderImage:[UIImage imageNamed:@"21-wrench"]];
	
    return headerView;
}


#pragma mark - tableview 代理

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{


}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	CGFloat height = 44.0f;
	if (indexPath.row == 0) {
		return 84.0f;
	}else if (indexPath.row == 1){
		return 160.0f;
	}else if (indexPath.row == 2){
		CGSize constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
		NSString* text = autoService.service_info;
		self.describeConentSize = [text sizeWithFont:[UIFont systemFontOfSize:FONT_SIZE]
								   constrainedToSize:constraint
									   lineBreakMode:NSLineBreakByCharWrapping];
		text = nil;
		height = self.describeConentSize.height + CELL_CONTENT_MARGIN*2 ;
		return height; // 动态
	}else {
		return 44.0f;
	}
	
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
	return 44.0f;
}
#pragma mark - 电话联系店铺

- (IBAction)contactTheShop:(UIButton *)sender {
	NSString* phoneNumber = [autoService valueForKeyPath:@"shop.contact"];
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",phoneNumber]]];
	
}
#pragma mark - 收藏
- (IBAction)markFav:(UIButton *)sender {
	if ([autoService.is_fav boolValue]) {
		autoService.is_fav = [NSNumber numberWithBool:NO];
		[sender setImage:[UIImage imageNamed:@"29-heart"] forState:UIControlStateNormal];
	}else{
		autoService.is_fav = [NSNumber numberWithBool:YES];
		[sender setImage:[UIImage imageNamed:@"red-heart"] forState:UIControlStateNormal];

	}
	[mocManager commitChanges];
}
@end
