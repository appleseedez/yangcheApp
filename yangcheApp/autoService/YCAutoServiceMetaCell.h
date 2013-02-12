//
//  YCAutoServiceMetaCell.h
//  yangcheApp
//
//  Created by Pharaoh on 13-1-15.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCAutoServiceMetaCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameView;
@property (weak, nonatomic) IBOutlet UILabel *priceView;
@property (weak, nonatomic) IBOutlet UILabel *uvView; // 多少人看过
@property (weak, nonatomic) IBOutlet UILabel *updateTimeView;
@property (weak, nonatomic) IBOutlet UILabel *addressView;



@end
