//
//  Test.swift
//  app
//
//  Created by Adrian Friedli on 03.01.15.
//  Copyright (c) 2015 Adrian Friedli. All rights reserved.
//

import UIKit

class Test : NSObject, PlayerListener {
	
	func run() {
		let notificationCenter = NotificationCenterImpl.getInstance()
		let resourceManager = ResourceManager(notificationCenter: notificationCenter)
		
		let player = resourceManager.getPlayerForKey(123);
		player!.addListener(self);
		resourceManager.notifyTestPlayer(); // should trigger
		player!.removeListener(self);
		resourceManager.notifyTestPlayer(); // should not trigger
		println("test finished");
	}
	
	func playerChanged(player: Player) {
		println("Yes, we can! (\(player.key))")
	}

}
