//
//  Notify.h
//  yangcheApp
//
//  Created by Pharaoh on 13-2-27.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Notify : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSString * body;

@end
