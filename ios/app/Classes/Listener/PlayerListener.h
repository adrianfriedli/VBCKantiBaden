//
//  PlayerListener.h
//  app
//
//  Created by Adrian Friedli on 03.01.15.
//  Copyright (c) 2015 Adrian Friedli. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ModelListener.h"

@class Player;

@protocol PlayerListener <ModelListener>

- (void)playerChanged:(Player *)player;

@end
