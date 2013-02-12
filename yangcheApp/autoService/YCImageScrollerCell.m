//
//  YCImageScrollerCell.m
//  yangcheApp
//
//  Created by Pharaoh on 13-1-27.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import "YCImageScrollerCell.h"

@implementation YCImageScrollerCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
		visiblePages = [[NSMutableSet alloc] init];
		recycledPages = [[NSMutableSet alloc] init];
		imageURLs = [NSMutableSet setWithArray:@[@"1",@"2"]];
		
		[self tilePages];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
# pragma mark - util methods
- (BOOL) isDisplayPageForIndex:(int)index{
	return 0;
}

- (void) configurePage:(YCImageScrollView*)page
			  forIndex:(NSUInteger) index{
	page.index = index;
	[page loadImage];
}

# pragma mark - ScrollView delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
	[self tilePages];
}


#pragma mark - dequeue & tile
- (YCImageScrollView*) dequeueRecycledPage{
	return [recycledPages anyObject];
}
- (void) tilePages{
	// 获得可视区域的边界
	CGRect visibleBounds = [self.scrollerView bounds];
	int firstNeededPageIndex=floorf(CGRectGetMinX(visibleBounds)/CGRectGetWidth(visibleBounds));
	int lastNeededPageIndex = floorf((CGRectGetMaxX(visibleBounds)-1)/CGRectGetWidth(visibleBounds));
	firstNeededPageIndex = MAX(0, firstNeededPageIndex);
	lastNeededPageIndex = MIN(lastNeededPageIndex, [imageURLs count]-1);
	
	
	// 将不在视野中的page移除
	for (YCImageScrollView* page in visiblePages) {
		if (page.index < firstNeededPageIndex || page.index > lastNeededPageIndex) {
			[page removeFromSuperview];
			[recycledPages addObject:page];	
		}
	}
	[visiblePages minusSet:recycledPages];
	
	// 将要显示的page添加进去
	for (int index=firstNeededPageIndex; index <= lastNeededPageIndex; ++index) {
		if (![self isDisplayPageForIndex:index]) {
			YCImageScrollView* page = [self dequeueRecycledPage];
			if (page == nil) {
				page = [[YCImageScrollView alloc] init];
			}
			[self configurePage:page forIndex:index];
			[self.scrollerView addSubview:page];
			[visiblePages addObject:page];
			
		}
	}
}

@end
