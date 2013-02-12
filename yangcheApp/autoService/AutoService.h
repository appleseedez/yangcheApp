//
//  AutoService.h
//  yangcheApp
//
//  Created by Pharaoh on 13-1-30.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Comment, Shop;

@interface AutoService : NSManagedObject

@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * distance;
@property (nonatomic, retain) NSNumber * is_fav;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * price;
@property (nonatomic, retain) NSString * service_info;
@property (nonatomic, retain) NSString * show_case;
@property (nonatomic, retain) NSString * stars;
@property (nonatomic, retain) NSString * thumb;
@property (nonatomic, retain) NSDate * update_time;
@property (nonatomic, retain) NSString * uv;
@property (nonatomic, retain) Shop *shop;
@property (nonatomic, retain) NSSet *comments;
@end

@interface AutoService (CoreDataGeneratedAccessors)

- (void)addCommentsObject:(Comment *)value;
- (void)removeCommentsObject:(Comment *)value;
- (void)addComments:(NSSet *)values;
- (void)removeComments:(NSSet *)values;

@end
