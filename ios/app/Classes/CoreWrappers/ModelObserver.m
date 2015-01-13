//
//  ModelObserver.m
//  app
//
//  Created by Adrian Friedli on 03.01.15.
//  Copyright (c) 2015 Adrian Friedli. All rights reserved.
//

#import "ModelObserver.h"
#import "ModelListener.h"
#import "ModelObserverKey.h"

@implementation ModelObserver {
	ModelObserverKey* _key;
	Notification _notification;
}

#pragma mark - Object Lifecycle
- (instancetype)initWithKey:(ModelObserverKey *)key notification:(Notification)notification {
	self = [super init];
	if (self) {
		_key = key;
		_notification = [notification copy];
	}
	return self;
}

#pragma mark - Public
- (BOOL)isInterestedForResourceId:(int32_t)resourceId key:(int32_t)key {
	return resourceId == _key.resourceId && key == _key.key;
}

- (void)notifyListener {
	_notification();
}

@end
