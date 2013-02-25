//
//  YCOrderFormInputAccessoryToolbar.m
//  yangcheApp
//
//  Created by Pharaoh on 13-2-23.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import "YCOrderFormInputAccessoryToolbar.h"

@implementation YCOrderFormInputAccessoryToolbar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"YCOrderFormInputAccessoryToolbarView" owner:self options:nil][0];
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
