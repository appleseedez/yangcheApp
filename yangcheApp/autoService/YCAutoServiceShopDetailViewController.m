//
//  YCAutoServiceShopDetailViewController.m
//  yangcheApp
//
//  Created by Pharaoh on 13-1-29.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "YCAutoServiceShopDetailViewController.h"
#import "AutoService.h"
#import "Shop.h"
#import "YCMocManager.h"
#import "YCAutoServiceDetailViewController.h"
#import "YCCommentViewCell.h"
#import "Comment.h"
#import "UIImageView+AFNetworking.h"

#import "YCShopHeadActionCell.h"
@interface YCAutoServiceShopDetailViewController (){
	Shop* shop;
	AutoService* autoService;
	YCMocManager* mocManager;
	NSMutableArray* comments;
	NSInteger segSelectedIndex;
}
@end

@implementation YCAutoServiceShopDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	segSelectedIndex = 1;
	// Do any additional setup after loading the view.
	mocManager = [[YCMocManager alloc] init];
	autoService = [mocManager fetchByURI:self.moURI];
	shop = [mocManager fetchByID:[autoService.shop objectID]];
	comments = [[NSMutableArray alloc] initWithArray:[autoService.comments allObjects]];
	
	
	self.shopMetaView.nameView.text = shop.name;
	self.shopMetaView.starsView.text =@"★★☆☆☆";
	
	[self.shopMetaView.thumbView setImageWithURL:[NSURL URLWithString:shop.thumb] placeholderImage:[UIImage imageNamed:@"21-wrench"]];
	

	
//	UIImage *bg = [[UIImage imageNamed:@"bg_seg"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
//	[[UISegmentedControl appearance] setBackgroundImage:bg forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

- (void)dealloc{
	mocManager = nil;
	shop = nil;
	autoService = nil;
	comments = nil;
	segSelectedIndex = 1;
}

#pragma mark - segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
	if([segue.identifier isEqualToString:@"backToServiceDetailFromShop"]){
		YCAutoServiceDetailViewController* detailViewController = [segue destinationViewController];
		detailViewController.moURI = [[autoService objectID] URIRepresentation];
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

    if (segSelectedIndex == 1) {
		return [comments count];
	}else{
		return 2;
	}
    
}
#define CELL_CONTENT_WIDTH 280.0
#define CELL_CONTENT_MARGIN 5.0
#define FONT_SIZE 12.0

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (segSelectedIndex == 1) {
		Comment* comment = comments[indexPath.row];
		YCCommentViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ShopTopCommentCell"];
		
		if (nil == cell) {
			cell = [[YCCommentViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ShopTopCommentCell"];
			
		}
		
		UILabel* textConent = nil; // 放文本
		textConent = [[UILabel alloc] initWithFrame:CGRectZero];
		[textConent setLineBreakMode:NSLineBreakByCharWrapping];
		[textConent setFont:[UIFont systemFontOfSize:FONT_SIZE]];
		[textConent setNumberOfLines:0];
		[textConent setTag:2];
		[[cell contentView ] addSubview:textConent];
		if (!textConent) {
			textConent = (UILabel*)[cell viewWithTag:2];
		}
		[textConent setText:comment.comment_body];
		
		CGSize constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
		CGFloat height = [textConent.text sizeWithFont:[UIFont systemFontOfSize:FONT_SIZE]
									 constrainedToSize:constraint
										 lineBreakMode:NSLineBreakByCharWrapping].height;
		[textConent setFrame:CGRectMake(CELL_CONTENT_MARGIN+20.0, CELL_CONTENT_MARGIN+57.0, CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2),height)];
		
		
		[cell.thumbView setImageWithURL:[NSURL URLWithString:comment.thumb] placeholderImage:[UIImage imageNamed:@"avatar-60"]];
		cell.nameView.text=comment.name;
		NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
		[formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
		cell.updateTimeView.text =  [formatter stringFromDate:comment.update_time];
		cell.starsView.text = comment.stars;
		return cell;
	}else{
		UITableViewCell* cell = nil;
		if (indexPath.row == 0) {
			cell = [tableView dequeueReusableCellWithIdentifier:@"ShopWorkersCell"];
			if (nil == cell) {
				cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ShopWorkersCell"];
			}
			
		}else if ( indexPath.row == 1){
			Comment* comment = comments[indexPath.row];
			cell = [tableView dequeueReusableCellWithIdentifier:@"ShopDescriptionViewCell"];
			if (nil == cell) {
				cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ShopDescriptionViewCell"];
			}
			UILabel* textConent = nil; // 放文本
			textConent = [[UILabel alloc] initWithFrame:CGRectZero];
			[textConent setLineBreakMode:NSLineBreakByCharWrapping];
			[textConent setFont:[UIFont systemFontOfSize:FONT_SIZE]];
			[textConent setNumberOfLines:0];
			[textConent setTag:2];
			[[cell contentView ] addSubview:textConent];
			if (!textConent) {
				textConent = (UILabel*)[cell viewWithTag:2];
			}
			[textConent setText:comment.comment_body];
			
			CGSize constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
			CGFloat height = [textConent.text sizeWithFont:[UIFont systemFontOfSize:FONT_SIZE]
										 constrainedToSize:constraint
											 lineBreakMode:NSLineBreakByCharWrapping].height;
			[textConent setFrame:CGRectMake(CELL_CONTENT_MARGIN+20.0f, CELL_CONTENT_MARGIN, CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2),height)];
			
		}else{
			cell = [tableView dequeueReusableCellWithIdentifier:@"ShopEmptyCell"];
			if (nil == cell) {
				cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ShopEmptyCell"];
			}
		}
		return cell;
	}
	
	
	
}




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	if (segSelectedIndex == 1) {
		Comment* comment=comments[indexPath.row];
		CGSize constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
		NSString* text = comment.comment_body;
		CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:FONT_SIZE]
					   constrainedToSize:constraint
						   lineBreakMode:NSLineBreakByCharWrapping];
		
		return 70.0+size.height;
	}else{
		if (indexPath.row == 0) {
			return 100.0f;
		}else if (indexPath.row == 1){
			Comment* comment=comments[indexPath.row]; // for test
			CGSize constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
			NSString* text = comment.comment_body;
			CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:FONT_SIZE]
						   constrainedToSize:constraint
							   lineBreakMode:NSLineBreakByCharWrapping];
			
			return CELL_CONTENT_MARGIN*2+size.height;
		}else{
			return 44.0f;
		}
		
	}
	
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
	return 34.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	
	YCShopHeadActionCell* headerView = [tableView dequeueReusableCellWithIdentifier:@"ShopActionHeadCell"];
    if (headerView == nil){
        headerView = [[YCShopHeadActionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ShopActionHeadCell"];
    }

	
	// 给header cell 加个边框
	CALayer* topBorder = [CALayer layer];
	topBorder.frame = CGRectMake(0, -1, self.view.frame.size.width, 1.0);
	topBorder.backgroundColor = [UIColor lightGrayColor].CGColor;
	[headerView.layer addSublayer:topBorder];

	
    return headerView;
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

- (IBAction)segSelectAction:(UISegmentedControl *)sender {
	if (sender.selectedSegmentIndex == 0) {
		segSelectedIndex = 0;
	}else if (sender.selectedSegmentIndex == 1){
		segSelectedIndex = 1;
	}

	[self.shopDetailTable reloadData];
}
@end
