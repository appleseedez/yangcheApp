//
//  YCPostCommentViewController.m
//  yangcheApp
//
//  Created by Pharaoh on 13-1-30.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import "YCPostCommentViewController.h"
#import "YCWriteCommentTextViewCell.h"
#import "YCInputAccessoryToolbar.h"
#import "YCSlideCommentCell.h"
@interface YCPostCommentViewController ()
{
	YCWriteCommentTextViewCell* writeTextCell;
	YCInputAccessoryToolbar* keyboardToolbar;
	CGRect originSize;
}
@end

@implementation YCPostCommentViewController

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
	originSize = self.writeCommentTableView.frame;
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

-(void)dealloc{
	[[NSNotificationCenter defaultCenter] removeObserver:self name:nil object:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	
	if (section == 0){
		return 1;
	}
    else if(section == 1) {
		return 4;
	}else{
		return 1;
	}
    
}
#define CELL_CONTENT_WIDTH 280.0
#define CELL_CONTENT_MARGIN 5.0
#define FONT_SIZE 12.0

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString* identifier = @"ScoreCommentCell";
	
	if (indexPath.section == 2 && indexPath.row == 0) {
		identifier = @"WriteCommentCell";
		YCWriteCommentTextViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
		if (nil == cell) {
			cell = [[YCWriteCommentTextViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
		}
		writeTextCell = cell;
		if (keyboardToolbar == nil) {
			keyboardToolbar = [[YCInputAccessoryToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
			// 被uibutton遮挡的情况下. 只能使用button的addTarget方法.我去啊
			[keyboardToolbar.hideKeyboardBtn addTarget:self action:@selector(hideKeyboardAction) forControlEvents:UIControlEventTouchUpInside];
			
		}
		if (cell.textView.inputAccessoryView == nil) {
			cell.textView.inputAccessoryView = keyboardToolbar;
		}
		
		return cell;
	}else if(indexPath.section == 1){
		identifier = @"ScoreCommentCell";
		YCSlideCommentCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
		
		if (nil == cell) {
			cell = [[YCSlideCommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
		}
		
		cell.valueTags =  @[@"坑爹啊",@"有点挫",@"一般般",@"很赞的",@"屌爆了"];
		if (indexPath.row == 0) {
			cell.titleView.text = @"描述相符";
			cell.commentSlider.value = 0;
		}else if (indexPath.row == 1){
			cell.titleView.text = @"服务态度";
			cell.commentSlider.value = 2;
		}else if (indexPath.row == 2){
			cell.titleView.text = @"服务质量";
			cell.commentSlider.value = 4;
		}else if (indexPath.row == 3){
			cell.titleView.text = @"环境设施";
			cell.commentSlider.value = 3;
		}
		
		cell.describeView.text = cell.valueTags[indexPath.row];
		return cell;
	}else {
		identifier = @"TotalScoreCommentCell";
		UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
		if (nil == cell) {
			cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
		}
		return cell;
	}
	
	
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	if (indexPath.row == 0 && indexPath.section == 2) {
		return 100.0;
	}
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
	
	
	
}
#pragma mark - action button
- (IBAction)backToCommentList:(UIButton *)sender
{
	[self dismissViewControllerAnimated:YES completion:nil];
}
- (void) hideKeyboardAction{
	if (writeTextCell) {
		[writeTextCell.textView resignFirstResponder];
	}
}

#pragma mark - keybaord notify
- (void)keyboardWillShow:(NSNotification *)notification{
	if (writeTextCell != nil) {

		NSDictionary *userInfo = [notification userInfo];
		// Get the origin of the keyboard when it's displayed.
		NSValue* aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
		// Get the top of the keyboard as the y coordinate of its origin in self's view's coordinate system. The bottom of the text view's frame should align with the top of the keyboard's final position.
		CGRect keyboardRect = [aValue CGRectValue];
		keyboardRect = [self.view convertRect:keyboardRect fromView:self.view];
		
		CGFloat keyboardTop = keyboardRect.origin.y;
		CGRect newTextViewFrame = self.writeCommentTableView.frame;
		
		newTextViewFrame.size.height = keyboardTop - self.writeCommentTableView.frame.origin.y;
		
		// Get the duration of the animation.
		NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
		NSTimeInterval animationDuration;
		[animationDurationValue getValue:&animationDuration];
		
		// Animate the resize of the text view's frame in sync with the keyboard's appearance.
		[UIView beginAnimations:nil context:NULL];
		
		[UIView setAnimationDuration:animationDuration];
		
		self.writeCommentTableView.frame = newTextViewFrame;

		[UIView commitAnimations];
		// inputaccessory的高度也要算
		[self.writeCommentTableView setContentOffset:CGPointMake(0, self.writeCommentTableView.frame.size.height+50.0f)];
		
	}
	
	
}
- (void)keyboardWillHide:(NSNotification *)notification{
	NSDictionary* userInfo = [notification userInfo];
	
    /*
     Restore the size of the text view (fill self's view).
     Animate the resize so that it's in sync with the disappearance of the keyboard.
     */
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
	
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animationDuration];
	
    self.writeCommentTableView.frame = originSize;
	
    [UIView commitAnimations];
	[self.writeCommentTableView setContentOffset:CGPointMake(0, 0)];
	
}

# pragma mark - textview delegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
	if (writeTextCell == nil) {
		return YES;
	}
	if(writeTextCell.textView.tag == 0){
		writeTextCell.textView.text = @"";
		writeTextCell.textView.textColor = [UIColor blackColor];
		writeTextCell.textView.tag = 1;
	}
	
	return YES ;
}
#define PLACE_HOLDER @"#我说两句#"

- (void)textViewDidEndEditing:(UITextView *)textView{
	if (writeTextCell == nil) {
		return;
	}
	
	if ([writeTextCell.textView.text length] == 0) {
		writeTextCell.textView.text = PLACE_HOLDER;
		writeTextCell.textView.textColor = [UIColor lightGrayColor];
		writeTextCell.textView.tag = 0;
	}
}

@end
