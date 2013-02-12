//
//  Comment.h
//  yangcheApp
//
//  Created by Pharaoh on 13-1-30.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class AutoService;

@interface Comment : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDate * update_time;
@property (nonatomic, retain) NSString * thumb;
@property (nonatomic, retain) NSString * comment_body;
@property (nonatomic, retain) NSString * stars;
@property (nonatomic, retain) AutoService *autoService;

@end
