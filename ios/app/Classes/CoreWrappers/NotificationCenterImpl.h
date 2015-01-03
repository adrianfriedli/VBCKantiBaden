//
//  NotificationCenterImpl.h
//  app
//
//  Created by Adrian Friedli on 03.01.15.
//  Copyright (c) 2015 Adrian Friedli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NotificationCenter.h"

@class Player;
@protocol PlayerListener;

@interface NotificationCenterImpl : NSObject <NotificationCenter>

#pragma mark - Singleton
+ (NotificationCenterImpl *)getInstance;
- (instancetype)init UNAVAILABLE_ATTRIBUTE;

#pragma mark - Listeners
- (void)addPlayerListener:(id<PlayerListener>)listener player:(Player *)player;
- (void)removePlayerListener:(id<PlayerListener>)listener player:(Player *)player;

@end
