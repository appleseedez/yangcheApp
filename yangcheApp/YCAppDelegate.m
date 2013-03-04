//
//  YCAppDelegate.m
//  yangcheApp
//
//  Created by Pharaoh on 13-1-7.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import "YCAppDelegate.h"
#import "PKRevealController.h"
#import "YCNotifyIndexViewController.h"
#import "YCExtraInfoViewController.h"
@implementation YCAppDelegate

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
		return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	// 导航栏皮肤
	UIImage *bg = [[UIImage imageNamed:@"nav_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
	[[UINavigationBar appearance] setBackgroundImage:bg forBarMetrics:UIBarMetricsDefault];
	// 工具栏皮肤
	[[UITabBar appearance] setBackgroundImage:bg];
	
	// 将PKRevealController 添加进来
	
	UIViewController* frontViewController =  self.window.rootViewController;
	self.window.rootViewController = nil;
	UIStoryboard* notifySB = [UIStoryboard storyboardWithName:@"Notify_iPhone_Storyboard" bundle:nil];
	UIStoryboard* extraInfoSB = [UIStoryboard storyboardWithName:@"Extra_iPhone_Storyboard" bundle:nil];
	
	YCNotifyIndexViewController* notifyListViewController = [notifySB instantiateInitialViewController];
	YCExtraInfoViewController* extraInfoListViewController = [extraInfoSB instantiateInitialViewController];
	
	self.revealController =[PKRevealController revealControllerWithFrontViewController:frontViewController
																	leftViewController:notifyListViewController
																   rightViewController:extraInfoListViewController
																			   options:nil];
	
	self.window.rootViewController = self.revealController;


	[self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
