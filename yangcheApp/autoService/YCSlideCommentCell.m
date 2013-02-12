//
//  YCSlideCommentCell.m
//  yangcheApp
//
//  Created by Pharaoh on 13-1-30.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import "YCSlideCommentCell.h"


@implementation YCSlideCommentCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
		
    }
	
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)valueChanged:(UISlider *)sender {
	float value = ceilf(sender.value);

	self.describeView.text = self.valueTags[[[NSNumber numberWithFloat:value] integerValue]];
}



@end
