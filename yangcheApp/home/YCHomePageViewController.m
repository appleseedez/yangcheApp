//
//  YCHomePageViewController.m
//  yangcheApp
//
//  Created by Pharaoh on 13-1-14.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import "YCHomePageViewController.h"
#import "PKRevealController.h"
#import "YCNotifyIndexViewController.h"
#import <QuartzCore/QuartzCore.h>
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

- (IBAction)indexInsurance:(id)sender{
	UIStoryboard* insuranceDetailSB = [UIStoryboard storyboardWithName:@"Insurance_Storyboard_iPhone" bundle:nil];
    [self presentViewController:[insuranceDetailSB instantiateInitialViewController] animated:YES completion:nil];
}

- (IBAction)indexQuickSavior:(id)sender{
	
}

- (IBAction)indexInDoorService:(id)sender{
	
}

- (IBAction)indexInquirance:(id)sender{
	
}

- (IBAction)indexClaims:(id)sender{
	UIStoryboard* claimDetailSB = [UIStoryboard storyboardWithName:@"Claims_Storyboard_iPhone" bundle:nil];
    [self presentViewController:[claimDetailSB instantiateInitialViewController] animated:YES completion:nil];
}
- (IBAction)toggleNotifyList:(UIButton *)sender {
	if (self.tabBarController.revealController.focusedController == self.tabBarController.revealController.leftViewController)
    {
        [self.tabBarController.revealController showViewController:self.tabBarController.revealController.frontViewController];
    }
    else
    {
		
        [self.tabBarController.revealController showViewController:self.tabBarController.revealController.leftViewController];
    }
	
}

- (IBAction)toggleExtraInfo:(UIButton *)sender {
	if (self.tabBarController.revealController.focusedController == self.tabBarController.revealController.rightViewController)
    {
        [self.tabBarController.revealController showViewController:self.tabBarController.revealController.frontViewController];
    }
    else
    {
		
        [self.tabBarController.revealController showViewController:self.tabBarController.revealController.rightViewController];
    }
}
@end
