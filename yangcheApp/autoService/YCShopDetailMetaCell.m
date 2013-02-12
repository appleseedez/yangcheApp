//
//  YCShopDetailMetaCell.m
//  yangcheApp
//
//  Created by Pharaoh on 13-2-8.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import "YCShopDetailMetaCell.h"
#import "UIImageView+YCUtils.h"
@implementation YCShopDetailMetaCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect{
	[super drawRect:rect];
	[self.thumbView addBorder];
}

@end
