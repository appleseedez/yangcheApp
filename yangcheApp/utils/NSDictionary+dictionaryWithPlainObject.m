//
//  NSDictionary+dictionaryWithPlainObject.m
//  yangcheApp
//
//  Created by Pharaoh on 13-1-29.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import "NSDictionary+dictionaryWithPlainObject.h"
#import <objc/runtime.h>
@implementation NSDictionary (dictionaryWithPlainObject)
+(NSDictionary*) dictionaryWithPlainObject:(id)object{
	NSMutableDictionary *dict = [NSMutableDictionary dictionary];
	
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([object class], &count);
	
    for (int i = 0; i < count; i++) {
        NSString *key = [NSString stringWithUTF8String:property_getName(properties[i])];
        [dict setObject:[object valueForKey:key] forKey:key];
    }
	
    free(properties);
	
    return [NSDictionary dictionaryWithDictionary:dict];
}
@end
