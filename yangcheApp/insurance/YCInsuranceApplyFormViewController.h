//
//  YCInsuranceApplyFormViewController.h
//  yangcheApp
//
//  Created by Pharaoh on 13-2-26.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCInsuranceApplyFormViewController : UITableViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *applyFormContactField;
@property (weak, nonatomic) IBOutlet UITextField *appyFormNameField;
@property (weak, nonatomic) IBOutlet UITextField *applyFormCarIdField;

@end
