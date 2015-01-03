//
//  NotificationCenterImpl.m
//  app
//
//  Created by Adrian Friedli on 03.01.15.
//  Copyright (c) 2015 Adrian Friedli. All rights reserved.
//

#import "NotificationCenterImpl.h"
#import "ModelObserver.h"
#import "ModelObserverKey.h"
#import "Player.h"
#import "PlayerListener.h"

@implementation NotificationCenterImpl {
	NSMutableDictionary* _observers;
}

#pragma mark - Singleton
+ (instancetype)getInstance {
	static NotificationCenterImpl* instance = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		instance = [[self alloc] init];
	});
	return instance;
}

#pragma mark - Object Lifecycle
- (instancetype)init {
	self = [super init];
	if (self) {
		_observers = [[NSMutableDictionary alloc] init];
	}
	return self;
}

#pragma mark - Listeners
- (void)addPlayerListener:(id<PlayerListener>)listener player:(Player *)player {
	ModelObserverKey* key = [[ModelObserverKey alloc] initWithListener:listener resourceId:player.resourceId key:player.key];
	[_observers setObject:[[ModelObserver alloc] initWithKey:key notification:^{
		[listener playerChanged:player];
	}] forKey:key];
}

- (void)removePlayerListener:(id<PlayerListener>)listener player:(Player *)player {
	ModelObserverKey* key = [[ModelObserverKey alloc] initWithListener:listener resourceId:player.resourceId key:player.key];
	[_observers removeObjectForKey:key];
}

#pragma mark - NotificationCenter
- (void)notifyListWithResourceId:(int32_t)resourceId {
	
}

- (void)notifyWithResourceId:(int32_t)resourceId key:(int32_t)key {
	for (ModelObserver* observer in [_observers allValues]) {
		if ([observer isInterestedForResourceId:resourceId key:key]) {
			[observer notifyListener];
		}
	}
}



@end
