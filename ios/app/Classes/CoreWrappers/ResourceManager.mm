//
//  ResourceManager.m
//  app
//
//  Created by Adrian Friedli on 03.01.15.
//  Copyright (c) 2015 Adrian Friedli. All rights reserved.
//

#import "ResourceManager.h"
#import "core_notification_center.h"
#import "core_resource_manager.h"
#import "NotificationCenter.h"
#import "Player+Internal.h"

class NotificationCenterProxy : public core::NotificationCenter {
private:
	id<NotificationCenter> _nc;
	
public:
	NotificationCenterProxy(id<NotificationCenter> nc) {
		_nc = nc;
	}
	
	virtual void notify(int resourceId, int key) const {
		[_nc notifyWithResourceId:resourceId key:key];
	}
	
	virtual void notifyList(int resourceId) const {
		[_nc notifyListWithResourceId:resourceId];
	}
};

@implementation ResourceManager {
	core::ResourceManager* _resourceManager;
	core::NotificationCenter* _notificationCenterProxy;
}

- (instancetype)initWithNotificationCenter:(id<NotificationCenter>)notificationCenter {
	self = [super init];
	if (self) {
		_notificationCenterProxy = new NotificationCenterProxy(notificationCenter);
		if (_notificationCenterProxy) {
			_resourceManager = new core::ResourceManager(_notificationCenterProxy);
		}
		if (!_resourceManager) {
			return nil;
		}
	}
	return self;
}

- (void)dealloc {
	delete _notificationCenterProxy;
	delete _resourceManager;
}

- (Player *)getPlayerForKey:(int32_t)key {
	std::shared_ptr<core::Player> player = _resourceManager->getPlayerForKey(key);
	return [[Player alloc] initWithPlayer:player];
}

- (void)notifyTestPlayer {
	_resourceManager->notifyTestPlayer();
}

@end

