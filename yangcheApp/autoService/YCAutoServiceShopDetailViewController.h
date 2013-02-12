//
//  YCAutoServiceShopDetailViewController.h
//  yangcheApp
//
//  Created by Pharaoh on 13-1-29.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YCShopDetailMetaCell.h"
@interface YCAutoServiceShopDetailViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet YCShopDetailMetaCell *shopMetaView;
- (IBAction)segSelectAction:(UISegmentedControl *)sender;
@property (weak, nonatomic) IBOutlet UITableView *shopDetailTable;

@property(nonatomic,weak) NSURL* moURI;
@end
