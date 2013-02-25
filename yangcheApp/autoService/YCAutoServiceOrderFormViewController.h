//
//  YCAutoServiceOrderFormViewController.h
//  yangcheApp
//
//  Created by Pharaoh on 13-2-22.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCAutoServiceOrderFormViewController : UITableViewController <UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *orderFormContactField;
@property (weak, nonatomic) IBOutlet UITextField *orderFormNameField;
@property (weak, nonatomic) IBOutlet UITextField *orderFormAppointmentField;
@property (weak, nonatomic) IBOutlet UITextField *orderFormEmailOptionField;
@property (weak, nonatomic) IBOutlet UITextField *orderFormCarInfoOptionField;
@property (weak, nonatomic) IBOutlet UITextField *orderFormPointsOptionField;
@property (weak,nonatomic) NSURL* moURI;
@end
