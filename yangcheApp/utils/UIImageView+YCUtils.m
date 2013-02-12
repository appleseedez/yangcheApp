//
//  UIImageView+YCUtils.m
//  yangcheApp
//
//  Created by Pharaoh on 13-1-27.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import "UIImageView+YCUtils.h"

@implementation UIImageView (YCUtils)
- (void)addBorder{

	
	CALayer* innerBorder = [CALayer layer];
	innerBorder.borderColor = [UIColor whiteColor].CGColor;
	innerBorder.borderWidth = (self.bounds.size.width / 15.0);
	innerBorder.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
	[self.layer addSublayer:innerBorder];
	
//	CALayer* outterBorder = [CALayer layer];
//	outterBorder.borderColor = [UIColor colorWithRed:0.871 green:0.871 blue:0.871 alpha:1].CGColor;
//	outterBorder.borderWidth = 0.5;
//	outterBorder.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
//	[self.layer addSublayer:outterBorder];
	
	[self.layer setBorderColor:[UIColor colorWithRed:0.871 green:0.871 blue:0.871 alpha:1].CGColor];
	[self.layer setBorderWidth:0.5];
}
@end
