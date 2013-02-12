//
//  Shop.h
//  yangcheApp
//
//  Created by Pharaoh on 13-1-30.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class AutoService;

@interface Shop : NSManagedObject

@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * contact;
@property (nonatomic, retain) NSString * feature;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * thumb;
@property (nonatomic, retain) AutoService *autoService;

@end
