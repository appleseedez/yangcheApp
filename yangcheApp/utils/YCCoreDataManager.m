//
//  YCCoreDataManager.m
//  yangcheApp
//
//  Created by Pharaoh on 13-1-13.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import "YCCoreDataManager.h"

@implementation YCCoreDataManager
@synthesize model,coordinator,moc;
#pragma mark -
#pragma init
+ (id) shared {
	static id shared = nil;
	if (shared == nil) {
		shared = [[self alloc] init];
	}
	return shared;
}

#define MODEL_RESOURCE @"YangcheApp"
#pragma mark -
#pragma mark Getters
- (NSManagedObjectModel*) model{
	if (model != nil) {
		return model;
	}
	model = [[NSManagedObjectModel alloc]
			 initWithContentsOfURL:[[NSBundle mainBundle]
									URLForResource:MODEL_RESOURCE withExtension:@"momd"]];
	return model;
}

- (NSPersistentStoreCoordinator *)coordinator
{
	if (coordinator != nil) {
		return coordinator;
	}
	NSError* error = nil;
	coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self model]];
	if(![coordinator addPersistentStoreWithType:NSSQLiteStoreType
								  configuration:nil
											URL:[[self storeDirectory] URLByAppendingPathComponent:@"YangcheApp.sqlite"]
										options:nil error:&error])
	{
		NSLog(@"路径解析失败 %@",error);
		abort();
	}
	return coordinator;
}
 
- (NSManagedObjectContext *)moc
{
	if (moc != nil) {
		return moc;
	}
	if (self.coordinator!=nil) {
		moc = [[NSManagedObjectContext alloc] init];
		[moc setPersistentStoreCoordinator:self.coordinator];
	}
	return moc;
}
#pragma mark - 
#pragma mark Save
- (void)saveMoc{
	NSError* error = nil;
	if (self.moc != nil) {
		if ([moc hasChanges] && ![moc save:&error]) {
			NSLog(@"保存失败 %@", error);
			abort();
		}
	}
}

#pragma mark -
#pragma mark Util
- (NSURL *)storeDirectory
{

	return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}
@end
