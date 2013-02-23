//
//  YCAutoServiceIndexViewController.m
//  yangcheApp
//
//  Created by Pharaoh on 13-1-13.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "YCAutoServiceIndexViewController.h"
#import "YCMocManager.h"
#import "YCAutoServiceIndexCell.h"
#import "YCAutoServiceDetailViewController.h"

#import "UIImageView+AFNetworking.h"
#import "AutoService.h"
#import "Shop.h"
#import "Comment.h"
#import "YCSeachConditionCell.h"
#import "YCOverLayView.h"
#import "YCCategoryOverLayView.h"
#import "YCSortMethodOverLayView.h"
#import "YCBackgroundView.h"
#define HEADER_CELL_IDENTIFIER @"HeaderSearchCell"
#define CONTENT_CELL_IDENTIFIER @"AutoServiceIndexCell"


@interface YCAutoServiceIndexViewController (){
	UIImageView* logoView;
	YCMocManager* mocManager;
	NSMutableArray* results;
	YCOverLayView* rangeOverLay;
	YCCategoryOverLayView* categoryOverLay;
	YCSortMethodOverLayView* sortMethodOverLay;
}



@end

@implementation YCAutoServiceIndexViewController

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
	logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"evernote-gray"]];
	[logoView setFrame:CGRectMake(0, -logoView.frame.size.height, logoView.frame.size.width, logoView.frame.size.height)];
	[logoView setCenter:CGPointMake(self.view.frame.size.width/2, -logoView.frame.size.height)];
	[self.view insertSubview:logoView belowSubview:self.tableView];
	
//	logoView = [[UIView alloc] initWithFrame:CGRectMake(0, -80, self.view.bounds.size.width,80)];
//	[logoView setBackgroundColor:[UIColor whiteColor]];
//
//	[logoView addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"evernote-gray"]]];
//	[[logoView.subviews lastObject] setTag:1];
//	[[logoView viewWithTag:1] setCenter:CGPointMake(logoView.frame.size.width/2, logoView.frame.size.height/2)];
//
//	[self.view insertSubview:logoView belowSubview:self.tableView];
	
	mocManager = [[YCMocManager alloc] init];
	results = [[NSMutableArray alloc] initWithArray:[mocManager fetchAutoServices]];
	
//	self.tableView.tableHeaderView = [self.tableView dequeueReusableCellWithIdentifier:HEADER_CELL_IDENTIFIER];
	
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
	results = nil;
	mocManager =nil;
	rangeOverLay = nil;
	categoryOverLay = nil;
	sortMethodOverLay = nil;
	logoView = nil;
}


-(void)dealloc{
	results = nil;
	mocManager =nil;
	rangeOverLay = nil;
	categoryOverLay = nil;
	sortMethodOverLay = nil;
	logoView=nil;
}
#pragma mark - segue action
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"showAutoServiceDetail"]) {
		YCAutoServiceDetailViewController* detailViewController = [segue destinationViewController];
		NSIndexPath* index = [self.tableView indexPathForSelectedRow];

		detailViewController.moURI = [[ [results objectAtIndex:index.row] objectID] URIRepresentation];
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

    // Return the number of rows in the section.
    return [results count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YCAutoServiceIndexCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AutoServiceIndexCell"];
	if (nil == cell) {
		cell=[[YCAutoServiceIndexCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AutoServiceIndexCell"];
	}
	
    AutoService* autoService = [results objectAtIndex:indexPath.row];
    cell.nameView.text = autoService.name;
	[cell.thumbView setImageWithURL:[NSURL URLWithString:autoService.thumb] placeholderImage:[UIImage imageNamed:@"21-wrench"]];
	
	cell.distanceView.text = autoService.distance;
	cell.addressView.text = autoService.address;
	cell.starsView.text =autoService.stars;
	
	cell.priceView.text =[NSString stringWithFormat:@"$ %@", autoService.price ];
	
	
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	
     YCSeachConditionCell* headerView = [tableView dequeueReusableCellWithIdentifier:HEADER_CELL_IDENTIFIER];
    if (headerView == nil){
        headerView = [[YCSeachConditionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:HEADER_CELL_IDENTIFIER];
    }
	// 给header cell 加个边框
	CALayer* topBorder = [CALayer layer];
	topBorder.frame = CGRectMake(0, -1, self.view.frame.size.width, 1.0);
	topBorder.backgroundColor = [UIColor lightGrayColor].CGColor;
	[headerView.layer addSublayer:topBorder];
	
	[headerView.setCategoryBtn addTarget:self action:@selector(ToggleCategoryOverLay) forControlEvents:UIControlEventTouchUpInside];
	[headerView.setRangeBtn addTarget:self action:@selector(ToggleRangeOverLay) forControlEvents:UIControlEventTouchUpInside];
	[headerView.setSortMethodBtn addTarget:self action:@selector(ToggleSortOverLay) forControlEvents:UIControlEventTouchUpInside];
	
    return headerView;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 80.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
	return 44.0f;
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
	
//	[self performSegueWithIdentifier:@"showDetail" sender:self];
	
}
#pragma mark - scroll delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	CGFloat scrollOffsetY =scrollView.contentOffset.y;
	CGRect backgroundViewFrame = logoView.frame;
	
	
	if (scrollOffsetY < 0) {

		backgroundViewFrame.origin.y = -logoView.frame.size.height + scrollOffsetY/4;
		
		
	}
	logoView.frame = backgroundViewFrame;
	
	
}
# pragma mark - action button
- (IBAction)backToHome:(UIBarButtonItem *)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
	
}

- (void) ToggleCategoryOverLay{
	// 创建浮层
	if (categoryOverLay == nil) {
		categoryOverLay = [[YCCategoryOverLayView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100.0f)];
		categoryOverLay.frame = CGRectOffset(categoryOverLay.frame, 0,self.navigationController.navigationBar.bounds.size.height+64.0f);
		[categoryOverLay setTag:0];
	}
	// 移除其他浮层
	if (rangeOverLay != nil && rangeOverLay.tag == 1) {
		[rangeOverLay removeFromSuperview];
		rangeOverLay.tag = 0;
	}
	if (sortMethodOverLay != nil && sortMethodOverLay.tag == 1) {
		[sortMethodOverLay removeFromSuperview];
		sortMethodOverLay.tag = 0;
	}
	
	// 显示浮层
	if (categoryOverLay.tag == 0) {
		[self.navigationController.view addSubview:categoryOverLay];
		//[self.tableView setScrollEnabled:NO];
		categoryOverLay.tag = 1;
		
	}else{ // 从渲染树移除
		
		[categoryOverLay removeFromSuperview];
		categoryOverLay.tag = 0;
	//	[self.tableView setScrollEnabled:YES];
		
	}
}

- (void) ToggleRangeOverLay{

	// 创建浮层
	if (rangeOverLay == nil) {
		rangeOverLay = [[YCOverLayView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100.0f)];
		rangeOverLay.frame = CGRectOffset(rangeOverLay.frame, 0,self.navigationController.navigationBar.bounds.size.height+64.0f);
		[rangeOverLay setTag:0];
	}
	// 移除其他浮层
	if (categoryOverLay != nil && categoryOverLay.tag == 1) {
		[categoryOverLay removeFromSuperview];
		categoryOverLay.tag = 0;
	}
	if (sortMethodOverLay != nil && sortMethodOverLay.tag == 1) {
		[sortMethodOverLay removeFromSuperview];
		sortMethodOverLay.tag = 0;
	}
	
	// 显示浮层
	if (rangeOverLay.tag == 0) {
		[self.navigationController.view addSubview:rangeOverLay];
		//[self.tableView setScrollEnabled:NO];
		rangeOverLay.tag = 1;
		
	}else{ // 从渲染树移除
		
		[rangeOverLay removeFromSuperview];
		rangeOverLay.tag = 0;
		//[self.tableView setScrollEnabled:YES];
		
	}
	
	
}
- (void) ToggleSortOverLay{
	
	// 创建浮层
	if (sortMethodOverLay == nil) {
		sortMethodOverLay = [[YCSortMethodOverLayView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100.0f)];
		sortMethodOverLay.frame = CGRectOffset(sortMethodOverLay.frame, 0,self.navigationController.navigationBar.bounds.size.height+64.0f);
		[sortMethodOverLay setTag:0];
	}
	// 移除其他浮层
	if (rangeOverLay != nil && rangeOverLay.tag == 1) {
		[rangeOverLay removeFromSuperview];
		rangeOverLay.tag = 0;
	}
	if (categoryOverLay != nil && categoryOverLay.tag == 1) {
		[categoryOverLay removeFromSuperview];
		categoryOverLay.tag = 0;
	}
	
	// 显示浮层
	if (sortMethodOverLay.tag == 0) {
		[self.navigationController.view addSubview:sortMethodOverLay];
	//	[self.tableView setScrollEnabled:NO];
		sortMethodOverLay.tag = 1;
		
	}else{ // 从渲染树移除
		
		[sortMethodOverLay removeFromSuperview];
		sortMethodOverLay.tag = 0;
		//[self.tableView setScrollEnabled:YES];
		
	}

	
}
- (IBAction)refreshIndex:(UIBarButtonItem *)sender {
	// only for test
	NSArray* thumbTestArr = @[@"http://img.taobaocdn.com/sns_logo/i1/T164WQXgFoXXb1upjX.jpg_60x60.jpg",@"http://img.taobaocdn.com/sns_logo/i3/T1Lnl4XeBqXXb1upjX.jpg_60x60.jpg",@"http://img.taobaocdn.com/sns_logo/i7/T17vXAXkxIXXaH.X6X.JPEG_60x60.jpg",@"http://img.taobaocdn.com/sns_logo/i4/T1M12rXiNtXXb1upjX.jpg_60x60.jpg",@"http://img03.taobaocdn.com/sns_logo/i3/T1diwcXjFaXXb1upjX_60x60.jpg"];
	NSArray* shopNameArr = @[@"成都金山汽车修理中心",@"保时捷成都特约维修",@"桑塔纳汽车特约维修点",@"东风日产特约维修",@"宝马别摸我维修点"];
	NSArray* shopContactArr = @[@"11111111",@"22222222",@"333333333"];
	NSArray* serverNameArr = @[@"四轮定位",@"轮胎清洁养护",@"玻璃贴膜",@"封釉",@"大包围加装",@"天使眼改装"];
	NSArray* addressArr =@[@"成都市东大街115号",@"成华区二仙桥东路口142号",@"金牛区抚琴路14号",@"蜀汉路东153号"];
	NSArray* distanceArr =@[@"500 m",@"1.5 km",@"2.5 km",@"3.5 km"];
	NSArray* starsArr = @[@"★",@"☆",@"★☆",@"★★",@"★★☆",@"★★★",@"★★★☆",@"★★★★☆",@"★★★★★",@"★★★★"];
	NSArray* starsForComment = @[@"★",@"★★",@"★★★",@"★★★★",@"★★★★★"];
	NSArray* serviceInfoArr = @[
	@"世界是一面镜子，每个人都可以在里面看见自己的影子。你对它皱眉，它给你一副尖酸的嘴脸。你对着它笑，跟着欢乐，它就是个高兴和善的伴侣；所以年轻人必须在这两条道路里面自己选择。\r\n—— 萨克雷",
	@"不年轻了，我们会说年轻真好；看到死亡，会说活着真好。伤心失意的时候，却说不出活着有什么好。然而，要是没有活下去，也就看不到人生的千回百转，也不会知道曾经认为无法承受的痛苦是会过去的。当你以为心已经荒芜，它却会出奇不意开出花来。那一刻 所有的荒芜都成了往事。活着就是君王。\r\n——张小娴",
	@"汽车养护用品，很简单，从字面就可以理解，就是对汽车进行保养的产品。曾几何时，汽车养护用品仅仅只是存在国内的高端消费人群，随着中国的强大，经济的高速发展，人民生活水平的快速提高，汽车已经慢慢的>成为了一种“家用电器”。汽车养护用品也慢慢的深入到大家的活，因此对于大部分人来说，也非常有必要对汽车养护用品有一个非常准确的了解。\n\t汽车养护用品对于汽车，就好像生活用品对于人；人有吃穿住行的需求，汽车也有自己13大系统的保养需要。俗语道：爱车，“七分养，三分修”，精心养护能让汽车时刻保持最工况或恢复汽车应有的性能，以最>大限度确保汽车的安全性，降低养车费用。经常保持车辆各个系统的清洁和润滑就能实现“以保代养，以养避修”，既能节约大笔维修费用，又能延长车辆的使用寿命，这也是汽车养护用品存在的意义之所在。",
	@"爱是绝对没有模式和规律的，爱也是不可能说清楚的。说得清楚的即不是爱，而只是一种利益的结合。我从来不相信门当户对的婚姻会幸福，更不相信年龄匹配，学识相似，男才女貌的姻缘会幸福。爱应该象一泓清馨的甘水。\r\n——美·卢森"];
	NSArray* commenters = @[@"Appleseedez",@"DayFly",@"WenTao",@"法海",@"白娘子",@"许仙"];

	Shop* shop = [mocManager insertNewObjectForEntityForName:@"Shop"];
	shop.name = shopNameArr[arc4random_uniform([shopNameArr count])];
	shop.contact =shopContactArr[arc4random_uniform([shopContactArr count])];
	shop.thumb = thumbTestArr[arc4random_uniform([thumbTestArr count])];
	shop.feature = starsArr[arc4random_uniform([starsArr count])];
	// 评论数据
	Comment* comment1 = [mocManager insertNewObjectForEntityForName:@"Comment"];
	comment1.name = commenters[arc4random_uniform([commenters count])];
	comment1.thumb = thumbTestArr[arc4random_uniform([thumbTestArr count])];
	comment1.stars = starsForComment[arc4random_uniform([starsForComment count])];
	comment1.update_time =  [NSDate date];
	comment1.comment_body = serviceInfoArr[arc4random_uniform([serviceInfoArr count])];
	
	Comment* comment2 = [mocManager insertNewObjectForEntityForName:@"Comment"];
	comment2.name = commenters[arc4random_uniform([commenters count])];
	comment2.thumb = thumbTestArr[arc4random_uniform([thumbTestArr count])];
	comment2.stars = starsForComment[arc4random_uniform([starsForComment count])];
	comment2.update_time =  [NSDate date];
	comment2.comment_body = serviceInfoArr[arc4random_uniform([serviceInfoArr count])];
	
	Comment* comment3 = [mocManager insertNewObjectForEntityForName:@"Comment"];
	comment3.name = commenters[arc4random_uniform([commenters count])];
	comment3.thumb = thumbTestArr[arc4random_uniform([thumbTestArr count])];
	comment3.stars = starsForComment[arc4random_uniform([starsForComment count])];
	comment3.update_time =  [NSDate date];
	comment3.comment_body = serviceInfoArr[arc4random_uniform([serviceInfoArr count])];
	
	AutoService* autoService = [mocManager insertNewObjectForEntityForName:@"AutoService"];
	autoService.name = serverNameArr[arc4random_uniform([serverNameArr count])];
	autoService.thumb = thumbTestArr[arc4random_uniform([thumbTestArr count])];
	autoService.address= addressArr[arc4random_uniform([addressArr count])];
	autoService.distance = distanceArr[arc4random_uniform([distanceArr count])];
	autoService.price = [NSNumber numberWithDouble:arc4random_uniform(10)*1000.0];
	autoService.stars = starsArr[arc4random_uniform([starsArr count])];
	autoService.service_info = serviceInfoArr[arc4random_uniform([serviceInfoArr count])];
	autoService.show_case = @"headshot2_60x60.jpg";
	autoService.is_fav = [NSNumber numberWithBool:YES];
	autoService.uv = @"1000人看过";
	autoService.update_time = [NSDate date];
	autoService.shop = shop;
	autoService.comments= [[NSSet alloc] initWithArray:@[comment1,comment2,comment3]];

	[mocManager commitChanges];
	results = [[NSMutableArray alloc] initWithArray:[mocManager fetchAutoServices]];
	
	 
	[self.tableView reloadData];
}
@end
