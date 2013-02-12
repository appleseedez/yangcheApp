//
//  YCMyProfileCell.m
//  yangcheApp
//
//  Created by Pharaoh on 13-1-28.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import "YCMyProfileCell.h"
#import "UIImageView+YCUtils.h"
@implementation YCMyProfileCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)drawRect:(CGRect)rect{
	[super drawRect:rect];
	[self.myProfileThumbView addBorder];
}
@end
