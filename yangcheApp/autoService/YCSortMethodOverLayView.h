//
//  YCSortMethodView.h
//  yangcheApp
//
//  Created by Pharaoh on 13-1-31.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCSortMethodOverLayView : UIView
@property (weak, nonatomic) IBOutlet UIButton *byRangeBtn;
@property (weak, nonatomic) IBOutlet UIButton *byPriceBtn;
@property (weak, nonatomic) IBOutlet UIButton *byScoreBtn;
- (IBAction)setCategoryAction:(UIButton *)sender;

@end
