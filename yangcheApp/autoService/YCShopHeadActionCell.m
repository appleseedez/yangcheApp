//
//  YCShopHeadActionCell.m
//  yangcheApp
//
//  Created by Pharaoh on 13-2-8.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import "YCShopHeadActionCell.h"

@implementation YCShopHeadActionCell

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

- (void)drawRect:(CGRect)rect{
	[super drawRect:rect];
	NSDictionary* attributes = [NSDictionary dictionaryWithObjectsAndKeys:
								[UIFont systemFontOfSize:12], UITextAttributeFont,
								[UIColor darkTextColor], UITextAttributeTextColor,
								nil];
	
	[self.segAction setTitleTextAttributes:attributes forState:UIControlStateNormal];
}

@end
