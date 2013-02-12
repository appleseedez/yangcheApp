//
//  YCMapViewController.m
//  yangcheApp
//
//  Created by Pharaoh on 13-1-21.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import "YCMapViewController.h"
#import "YCAutoServiceDetailViewController.h"
#import "YCMocManager.h"
#import "AutoService.h"
@interface YCMapViewController (){
	YCMocManager* mocManager;
	AutoService* autoService;
}

@end

@implementation YCMapViewController

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

	// DAO服务
	mocManager = [[YCMocManager alloc] init];
	// 根据manageObject的全局URL获取该数据对象
	autoService = [mocManager fetchByURI:self.moURI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
	if([segue.identifier isEqualToString:@"backToServiceDetailFromMap"]){
		YCAutoServiceDetailViewController* detailViewController = [segue destinationViewController];
		detailViewController.moURI = [[autoService objectID] URIRepresentation];
	}
}
@end
