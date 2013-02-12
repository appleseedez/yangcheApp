// coredata 的工厂
//  YCCoreDataManager.h
//  yangcheApp
//
//  Created by Pharaoh on 13-1-13.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCCoreDataManager : NSObject
@property (nonatomic,readonly) NSManagedObjectContext* moc;
@property (nonatomic,readonly) NSManagedObjectModel* model;
@property (nonatomic,readonly) NSPersistentStoreCoordinator* coordinator;

+ (id) shared;
- (void) saveMoc; // 保存moc对象
- (NSURL*) storeDirectory;

@end
