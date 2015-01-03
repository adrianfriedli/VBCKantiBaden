//
//  NotificationCenter.h
//  app
//
//  Created by Adrian Friedli on 03.01.15.
//  Copyright (c) 2015 Adrian Friedli. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NotificationCenter

- (void)notifyListWithResourceId:(int32_t)resourceId;
- (void)notifyWithResourceId:(int32_t)resourceId key:(int32_t)key;

@end
