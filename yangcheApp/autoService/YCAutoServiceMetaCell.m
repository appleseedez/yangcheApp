//
//  YCAutoServiceMetaCell.m
//  yangcheApp
//
//  Created by Pharaoh on 13-1-15.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import "YCAutoServiceMetaCell.h"
#import "UIImageView+YCUtils.h"
@implementation YCAutoServiceMetaCell

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



#pragma mark - Action
// 联系服务
- (IBAction)callTheService:(UIButton *)sender {
	
	
}
@end
