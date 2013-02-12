//
//  YCHomePageViewController.m
//  yangcheApp
//
//  Created by Pharaoh on 13-1-14.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import "YCHomePageViewController.h"

@interface YCHomePageViewController ()

@end

@implementation YCHomePageViewController

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

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - actions
- (IBAction)indexAutoService:(id)sender {
	
	
	UIStoryboard* sericeDetailSB = [UIStoryboard storyboardWithName:@"AutoServiceStoryboard_iPhone" bundle:nil];
    [self presentViewController:[sericeDetailSB instantiateInitialViewController] animated:YES completion:nil];
}

@end
