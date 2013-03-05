//
//  YCGlobalSearchViewController.h
//  yangcheApp
//
//  Created by Pharaoh on 13-3-5.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCGlobalSearchViewController : UITableViewController <UISearchBarDelegate,UISearchDisplayDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *globalSearchBar;

@end
