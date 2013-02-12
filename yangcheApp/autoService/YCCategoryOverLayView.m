//
//  YCCategoryView.m
//  yangcheApp
//
//  Created by Pharaoh on 13-1-31.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import "YCCategoryOverLayView.h"
#import <QuartzCore/QuartzCore.h>
@implementation YCCategoryOverLayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"CategoryOverLayView" owner:self options:nil][0];
		
		
    }
	
	CALayer* bottomBorder = [CALayer layer];
	bottomBorder.frame = CGRectMake(0, 270.0, self.frame.size.width, 1.0);
	bottomBorder.backgroundColor = [UIColor lightGrayColor].CGColor;
	[self.todoBtn.layer addSublayer:bottomBorder];
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (IBAction)setCategoryAction:(UIButton*)sender {
	self.tag = 0;
	[self removeFromSuperview];
}
@end
