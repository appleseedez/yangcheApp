//
//  YCCategoryOverLayView.h
//  yangcheApp
//
//  Created by Pharaoh on 13-1-31.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCCategoryOverLayView : UIView
- (IBAction)setCategoryAction:(UIButton*)sender;
@property (weak, nonatomic) IBOutlet UIButton *todoBtn; // 分类选择 未完成

@end
