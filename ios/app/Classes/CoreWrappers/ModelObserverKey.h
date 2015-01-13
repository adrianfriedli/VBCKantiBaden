//
//  ModelObserverKey.h
//  app
//
//  Created by Adrian Friedli on 03.01.15.
//  Copyright (c) 2015 Adrian Friedli. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ModelListener;

@interface ModelObserverKey : NSObject <NSCopying>

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
- (instancetype)initWithListener:(id<ModelListener>)listener resourceId:(int32_t)resourceId key:(int32_t)key;

@property (nonatomic, readonly) id<ModelListener> listener;
@property (nonatomic, readonly) int32_t resourceId;
@property (nonatomic, readonly) int32_t key;

@end
