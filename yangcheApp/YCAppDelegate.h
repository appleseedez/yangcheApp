//
//  YCAppDelegate.h
//  yangcheApp
//
//  Created by Pharaoh on 13-1-7.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//
@class PKRevealController;
#import <UIKit/UIKit.h>

@interface YCAppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong, readwrite) PKRevealController *revealController;
@property (strong, nonatomic) UIWindow *window;

@end
