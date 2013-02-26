//
//  YCGlobalSearchViewController.m
//  yangcheApp
//
//  Created by Pharaoh on 13-2-26.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import "YCGlobalSearchViewController.h"

@interface YCGlobalSearchViewController ()
@property(weak,nonatomic) IBOutlet UISearchBar* searchBar;
@end

@implementation YCGlobalSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	[self.searchBar setShowsCancelButton:NO animated:YES];
	UIImage *bg = [[UIImage imageNamed:@"nav_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
	[[UISearchBar appearance] setBackgroundImage:bg];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
	[searchBar setShowsCancelButton:YES animated:YES];
	return YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
	[searchBar resignFirstResponder];
    [searchBar setShowsCancelButton:NO animated:YES];
}
@end
