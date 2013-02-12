//
//  YCCommentsViewController.h
//  yangcheApp
//
//  Created by Pharaoh on 13-1-29.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCCommentsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) NSURL* moURI;
- (IBAction)backFromComments:(UIButton *)sender;



@end
