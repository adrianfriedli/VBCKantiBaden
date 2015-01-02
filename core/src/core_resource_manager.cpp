/*
 * Copyright (C) 2015  Adrian Friedli adrian.friedli@iaeth.ch
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

#include "core_resource_manager.h"
#include "models/core_player.h"
#include "core_notification_center.h"

namespace core {

ResourceManager::ResourceManager(const NotificationCenter& notificationCenter) {
  this->notificationCenter = &notificationCenter;
}

ResourceManager::~ResourceManager() {
  if (testPlayer != 0) {
    delete testPlayer;
  }
}

Player* ResourceManager::getPlayerForKey(int key) {
  testPlayer = new Player(key);
  return testPlayer;
}

void ResourceManager::notifyTestPlayer() {
  notificationCenter->notify(testPlayer->resourceId(), testPlayer->key());
}

} // namespace core
