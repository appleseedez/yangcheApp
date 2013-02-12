//
//  YCAutoServiceDetailViewController.h
//  yangcheApp
//
//  Created by Pharaoh on 13-1-14.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YCImageScrollView.h"

@interface YCAutoServiceDetailViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
@property(nonatomic,weak)NSURL *moURI;
- (IBAction)contactTheShop:(UIButton *)sender;

- (IBAction)markFav:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *favBtnView;


@end
