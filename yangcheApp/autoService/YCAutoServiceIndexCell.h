//
//  YCAutoServiceIndexCell.h
//  yangcheApp
//
//  Created by Pharaoh on 13-1-13.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCAutoServiceIndexCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *thumbView;
@property (weak, nonatomic) IBOutlet UILabel *nameView;
@property (weak, nonatomic) IBOutlet UILabel *addressView;
@property (weak, nonatomic) IBOutlet UILabel *starsView;
@property (weak, nonatomic) IBOutlet UILabel *distanceView;
@property (weak, nonatomic) IBOutlet UILabel *priceView;
@property (nonatomic) NSManagedObjectID* entityID;
@end
