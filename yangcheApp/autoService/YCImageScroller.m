//
//  YCImageScroller.m
//  yangcheApp
//
//  Created by Pharaoh on 13-1-27.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import "YCImageScroller.h"

@implementation YCImageScroller
- (id)initWithCoder:(NSCoder *)aDecoder{
	if (self = [super initWithCoder:aDecoder]) {
		self.contentSize = CGSizeMake(320.0*3, 80.0);
	}
	return self;
}





// 将scrollview 的contentSize居中
-(void) recenterIfNecessary {
	CGPoint currentOffset = [self contentOffset];
	CGFloat contentWith = [self contentSize].width;
	CGFloat centerOffsetX = (contentWith - [self bounds].size.width)/2.0;
	CGFloat distanceFromCenter = fabs(currentOffset.x - centerOffsetX);
	if (distanceFromCenter > (contentWith / 4.0)) {
		self.contentOffset = CGPointMake(centerOffsetX, currentOffset.y);
	}
	
}

- (void)layoutSubviews{
	
	
	
	[super layoutSubviews];
	//[self recenterIfNecessary];
	
}

@end
