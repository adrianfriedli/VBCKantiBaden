//
//  Player.m
//  app
//
//  Created by Adrian Friedli on 28.12.14.
//  Copyright (c) 2014 Adrian Friedli. All rights reserved.
//

#import "Player.h"
#import "Player+Internal.h"

#import "core_player.h"
#import "NotificationCenterImpl.h"
#import "PlayerListener.h"

@implementation Player {
	std::shared_ptr<core::Player> _player;
}

#pragma mark - Object Lifecycle
- (instancetype)initWithKey:(int32_t)key {
	return [self initWithPlayer:std::make_shared<core::Player>(key)];
}

- (instancetype)initWithPlayer:(std::shared_ptr<core::Player>)player {
	self = [super init];
	if (self) {
		_player = player;
		if (!_player) {
			return nil;
		}
	}
	return self;
}

#pragma mark - NSObject
- (BOOL)isEqual:(id)object {
	if (![object isKindOfClass:Player.class]) {
		return NO;
	}
	Player* other = (Player *)object;
	return other->_player == _player;
}

#pragma mark - Public
- (int32_t)resourceId {
	return _player->resourceId();
}

- (int32_t)key {
	return _player->key();
}

- (NSString *)name {
	const char* name = _player->name().c_str();
	return [NSString stringWithUTF8String:name];
}

- (void)addListener:(id<PlayerListener>)listener {
	[[NotificationCenterImpl getInstance] addPlayerListener:listener player:self];
}

- (void)removeListener:(id<PlayerListener>)listener {
	[[NotificationCenterImpl getInstance] removePlayerListener:listener player:self];
}

@end
