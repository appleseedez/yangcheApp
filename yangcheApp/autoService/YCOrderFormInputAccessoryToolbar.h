//
//  YCOrderFormInputAccessoryToolbar.h
//  yangcheApp
//
//  Created by Pharaoh on 13-2-23.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCOrderFormInputAccessoryToolbar : UIToolbar
@property (weak, nonatomic) IBOutlet UIButton *prevBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (weak, nonatomic) IBOutlet UIButton *closeKeybord;
@property (nonatomic) NSInteger currentFocusFieldIndex;
@end
