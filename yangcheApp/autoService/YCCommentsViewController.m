//
//  YCCommentsViewController.m
//  yangcheApp
//
//  Created by Pharaoh on 13-1-29.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import "YCCommentsViewController.h"
#import "YCAutoServiceDetailViewController.h"
#import "AutoService.h"
#import "YCMocManager.h"
#import "YCCommentViewCell.h"
#import "Comment.h"
#import "UIImageView+AFNetworking.h"
@interface YCCommentsViewController (){
	AutoService* autoService;
	YCMocManager* mocManager;
	NSMutableArray* comments;
}

@end

@implementation YCCommentsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
#pragma mark - lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
	//[self.inputFieldView becomeFirstResponder];

	mocManager = [[YCMocManager alloc] init];
	autoService = [mocManager fetchByURI:self.moURI];

	
	comments = [[NSMutableArray alloc] initWithArray:[autoService.comments allObjects]];
}
- (void)dealloc{

	autoService = nil;
	mocManager = nil;
	comments = nil;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

#pragma mark - segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
	if([segue.identifier isEqualToString:@"backToServiceDetailFromComments"]){
		YCAutoServiceDetailViewController* detailViewController = [segue destinationViewController];
		detailViewController.moURI = [[autoService objectID] URIRepresentation];
	}
}
#pragma mark - action
- (IBAction)backFromComments:(UIButton *)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	
    // Return the number of sections.
    return [comments count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	
    // Return the number of rows in the section.
    return 1;
}
#define CELL_CONTENT_WIDTH 290.0
#define CELL_CONTENT_MARGIN 5.0
#define FONT_SIZE 12.0

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	
	Comment* comment = comments[indexPath.row];
	YCCommentViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"CommentCell"];
	
	if (nil == cell) {
		cell = [[YCCommentViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CommentCell"];
		
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

}




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	Comment* comment=comments[indexPath.row];
	CGSize constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
	NSString* text = comment.comment_body;
	CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:FONT_SIZE]
							   constrainedToSize:constraint
								   lineBreakMode:NSLineBreakByCharWrapping];
	
	return 70.0+size.height;
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
@end
