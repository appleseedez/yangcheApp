//
//  YCClaimViewController.m
//  yangcheApp
//
//  Created by Pharaoh on 13-2-26.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import "YCClaimViewController.h"

@interface YCClaimViewController ()

@end

@implementation YCClaimViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)backToHome:(UIBarButtonItem *)sender{
	[self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)contactHome:(UIButton *)sender{
	NSString* phoneNumber = @"88888888";//[autoService valueForKeyPath:@"shop.contact"];
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",phoneNumber]]];
}
@end
