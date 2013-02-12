//
//  YCPostCommentViewController.h
//  yangcheApp
//
//  Created by Pharaoh on 13-1-30.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCPostCommentViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextViewDelegate>
- (IBAction)backToCommentList:(UIButton *)sender;


@property (weak, nonatomic) IBOutlet UITableView *writeCommentTableView;


@end
