//  对数据的操作服务. 供业务调用
//  YCMocManager.h
//  yangcheApp
//
//  Created by Pharaoh on 13-1-13.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCMocManager : NSObject{
	NSManagedObjectContext* moc;
}

- (id) fetchByID:(NSManagedObjectID*) objectID;
-(id) fetchByURI:(NSURL*) url;
-(id) insertNewObjectForEntityForName:(NSString*) name;
//- (void) insertAutoServiceWithObject:(id) object;
//- (void) insertEntityForName:(NSString*) name
//				 valueObject:(id) valueObject;

- (NSArray*) fetchAutoServices;
-(NSArray*) fetchShops;
- (NSArray*) fetchEntitiesForName:(NSString*) name;
- (void) deleteAutoService:(NSManagedObject*) autoService;
- (void) commitChanges;

@end
