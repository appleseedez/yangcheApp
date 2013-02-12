//
//  YCImageScrollerCell.h
//  yangcheApp
//
//  Created by Pharaoh on 13-1-27.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YCImageScroller.h"
#import "YCImageScrollView.h"
@interface YCImageScrollerCell : UITableViewCell <UIScrollViewDelegate>{
	NSMutableSet* visiblePages;
	NSMutableSet* recycledPages;
	NSMutableSet* imageURLs;
}
@property (weak, nonatomic) IBOutlet YCImageScroller *scrollerView;
- (YCImageScrollView*) dequeueRecycledPage;
- (void) tilePages;

@end
