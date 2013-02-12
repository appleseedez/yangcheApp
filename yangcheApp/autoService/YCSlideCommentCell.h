//
//  YCSlideCommentCell.h
//  yangcheApp
//
//  Created by Pharaoh on 13-1-30.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCSlideCommentCell : UITableViewCell{
	
}
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UISlider *commentSlider;
@property (weak, nonatomic) IBOutlet UILabel *describeView;
- (IBAction)valueChanged:(UISlider *)sender;
@property (nonatomic) NSArray* valueTags;
@end
