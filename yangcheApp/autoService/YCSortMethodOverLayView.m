//
//  YCSortMethodView.m
//  yangcheApp
//
//  Created by Pharaoh on 13-1-31.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import "YCSortMethodOverLayView.h"
#import <QuartzCore/QuartzCore.h>
@implementation YCSortMethodOverLayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"SortMethodOverLayView" owner:self options:nil][0];
    }
	CALayer* bottomBorder = [CALayer layer];
	bottomBorder.frame = CGRectMake(0, 44.0, self.frame.size.width, 1.0);
	bottomBorder.backgroundColor = [UIColor lightGrayColor].CGColor;
	[self.byScoreBtn.layer addSublayer:bottomBorder];

	bottomBorder = [CALayer layer];
	bottomBorder.frame = CGRectMake(0, 44.0, self.frame.size.width, 1.0);
	bottomBorder.backgroundColor = [UIColor lightGrayColor].CGColor;
	[self.byPriceBtn.layer addSublayer:bottomBorder];
	
	bottomBorder = [CALayer layer];
	bottomBorder.frame = CGRectMake(0, 44.0, self.frame.size.width, 1.0);
	bottomBorder.backgroundColor = [UIColor lightGrayColor].CGColor;
	[self.byRangeBtn.layer addSublayer:bottomBorder];
	
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

- (IBAction)setCategoryAction:(UIButton *)sender {
	NSString* sortMethod = @"distance";
	if (sender.tag == 0) {
		sortMethod = @"distance";
	}else if (sender.tag == 1){
		sortMethod =@"price";
	}else if (sender.tag == 2){
		sortMethod = @"stars";
	}
	
	self.tag = 0;
	[self removeFromSuperview];
}
@end
