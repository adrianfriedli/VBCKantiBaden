//
//  Player.h
//  app
//
//  Created by Adrian Friedli on 28.12.14.
//  Copyright (c) 2014 Adrian Friedli. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PlayerListener;

@interface Player : NSObject

- (instancetype)init UNAVAILABLE_ATTRIBUTE;

@property (nonatomic, readonly) int32_t resourceId;
@property (nonatomic, readonly) int32_t key;
@property (nonatomic, readonly, copy) NSString* name;

- (void)addListener:(id<PlayerListener>)listener;
- (void)removeListener:(id<PlayerListener>)listener;

@end
