//
//  YCBackgroundView.m
//  yangcheApp
//
//  Created by Pharaoh on 13-1-31.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import "YCBackgroundView.h"

@implementation YCBackgroundView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       self = [[NSBundle mainBundle] loadNibNamed:@"BackgroundView" owner:self options:nil][0];
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

@end
