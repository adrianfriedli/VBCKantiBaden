//
//  Player+Internal.h
//  app
//
//  Created by Adrian Friedli on 03.01.15.
//  Copyright (c) 2015 Adrian Friedli. All rights reserved.
//

#import "Player.h"
#import "core_player.h"

@interface Player (Internal)

- (instancetype)initWithPlayer:(core::Player *)player;

@end