//
//  ResourceManager.h
//  app
//
//  Created by Adrian Friedli on 03.01.15.
//  Copyright (c) 2015 Adrian Friedli. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NotificationCenter;
@class Player;

@interface ResourceManager : NSObject

- (instancetype)initWithNotificationCenter:(id<NotificationCenter>)notificationCenter;

- (Player *)getPlayerForKey:(int32_t)key;
- (void)notifyTestPlayer;

@end
