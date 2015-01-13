//
//  ModelObserver.h
//  app
//
//  Created by Adrian Friedli on 03.01.15.
//  Copyright (c) 2015 Adrian Friedli. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Notification)();

@class ModelObserverKey;

@interface ModelObserver : NSObject

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
- (instancetype)initWithKey:(ModelObserverKey *)key notification:(Notification)notification;

- (BOOL)isInterestedForResourceId:(int32_t)resourceId key:(int32_t)key;
- (void)notifyListener;

@end
