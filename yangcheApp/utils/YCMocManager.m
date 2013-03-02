//  ModelObjectContext 
//  YCMocManager.m
//  yangcheApp
//
//  Created by Pharaoh on 13-1-13.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import "YCMocManager.h"
#import "YCCoreDataManager.h"

@implementation YCMocManager

#pragma mark -
#pragma mark init
- (id) init {
	if ((self =[super init])) {
		moc = [[YCCoreDataManager shared] moc];
		
		//[self printPathToStore]; // debugger
	}
	return self;
}

#pragma mark - AutoService CRUD
#define AUTO_SERVICE_ENTITY @"AutoService"
#define SHOP_ENTITY @"Shop"
#define NOTIFY @"Notify"
-(id) insertNewObjectForEntityForName:(NSString*) name{
	return [NSEntityDescription insertNewObjectForEntityForName:name inManagedObjectContext:moc];

}

//- (void) insertAutoServiceWithObject:(id) object
//
//{
//	[self insertEntityForName:AUTO_SERVICE_ENTITY valueObject:object];
//}
//
//- (void) insertEntityForName:(NSString*) name
//				 valueObject:(id) valueObject
//{
//	NSManagedObject* entity = [NSEntityDescription insertNewObjectForEntityForName:name inManagedObjectContext:moc];
//	[entity setValuesForKeysWithDictionary:[NSDictionary dictionaryWithPlainObject:valueObject]];
//}

- (NSArray*) fetchAutoServices
{
	return [self fetchEntitiesForName:AUTO_SERVICE_ENTITY];
}

- (NSArray*) fetchNotifies
{
	return [self fetchEntitiesForName:NOTIFY];
}

-(NSArray*) fetchShops
{
	return [self fetchEntitiesForName:SHOP_ENTITY];
}

- (NSArray*) fetchEntitiesForName:(NSString*) name{
	NSError* error;
	NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];
	NSEntityDescription* entity = [NSEntityDescription entityForName:name inManagedObjectContext:moc];
	[fetchRequest setEntity:entity];
	[fetchRequest setFetchBatchSize:10];
	
	//NSSortDescriptor* sorter = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
	//[fetchRequest setSortDescriptors:@[sorter]];
	return [moc executeFetchRequest:fetchRequest error:&error];
}


- (id) fetchByID:(NSManagedObjectID*) objectID
{
	return [moc objectWithID:objectID];
	
}

-(id) fetchByURI:(NSURL*) url
{
	return [moc objectWithID:[moc.persistentStoreCoordinator managedObjectIDForURIRepresentation:url]];
}
- (void) deleteAutoService:(NSManagedObject*) autoService
{
	[moc deleteObject:autoService];
}

#pragma mark - commit
- (void) commitChanges
{
	[[YCCoreDataManager shared] saveMoc];
}


#pragma mark -
#pragma mark Utils
- (void) printPathToStore {
	NSLog(@"%@",[[YCCoreDataManager shared] storeDirectory].path);
}
@end
