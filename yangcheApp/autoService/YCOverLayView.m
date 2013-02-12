//
//  YCOverLayView.m
//  yangcheApp
//
//  Created by Pharaoh on 13-1-30.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import "YCOverLayView.h"

@implementation YCOverLayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"OverLayView" owner:self options:nil][0];
    }
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

/*
  距离选择浮层的按钮响应
*/
- (IBAction)setRange:(UIButton *)sender {
	// 设置关闭标志位
	self.tag = 0;
	[self removeFromSuperview];
}
@end
