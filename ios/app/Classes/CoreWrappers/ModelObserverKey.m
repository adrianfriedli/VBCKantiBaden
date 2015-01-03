//
//  ModelObserverKey.m
//  app
//
//  Created by Adrian Friedli on 03.01.15.
//  Copyright (c) 2015 Adrian Friedli. All rights reserved.
//

#import "ModelObserverKey.h"
#import "ModelListener.h"

@implementation ModelObserverKey

#pragma mark - Object Lifecycle
- (instancetype)initWithListener:(id<ModelListener>)listener resourceId:(int32_t)resourceId key:(int32_t)key {
	self = [super init];
	if (self) {
		_listener = listener;
		_resourceId = resourceId;
		_key = key;
	}
	return self;
}

#pragma mark - NSCopying
- (id)copyWithZone:(NSZone *)zone {
	return [[ModelObserverKey alloc] initWithListener:_listener resourceId:_resourceId key:_key];
}

#pragma mark - NSObject
- (BOOL)isEqual:(id)object {
	if (![object isKindOfClass:ModelObserverKey.class]) {
		return NO;
	}
	ModelObserverKey* other = (ModelObserverKey *)object;
	return (other.listener == self.listener) && (other.resourceId == self.resourceId) && (other.key == self.key);
}

- (NSUInteger)hash {
	NSUInteger hash = [self.listener hash];
	hash += 31* hash + self.resourceId;
	return 31 * hash + self.key;
}

@end
