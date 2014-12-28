//
//  PlayerWrapper.m
//  app
//
//  Created by Adrian Friedli on 28.12.14.
//  Copyright (c) 2014 Adrian Friedli. All rights reserved.
//

#import "PlayerWrapper.h"

#import "player.h"

@implementation PlayerWrapper {
    Player* _player;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _player = new Player();
        if (!_player) {
            return nil;
        }
    }
    return self;
}

- (void)dealloc {
    delete _player;
}

#pragma mark - Public
- (NSString *)name {
    const char* name = _player->name().c_str();
    return [NSString stringWithUTF8String:name];
}

@end
