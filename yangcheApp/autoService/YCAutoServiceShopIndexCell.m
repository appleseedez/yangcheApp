//
//  YCAutoServiceShopIndexCell.m
//  yangcheApp
//
//  Created by Pharaoh on 13-1-14.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import "YCAutoServiceShopIndexCell.h"
#import "UIImageView+YCUtils.h"
@implementation YCAutoServiceShopIndexCell

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
	[self.thumbView addBorder];
}
@end
