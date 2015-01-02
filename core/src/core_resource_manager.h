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

#ifndef CORE_RESOURCE_MANAGER_H_
#define CORE_RESOURCE_MANAGER_H_

namespace core {

class NotificationCenter;
class Player;

class ResourceManager {
private:
  const NotificationCenter* notificationCenter;
  Player* testPlayer;
public:
  ResourceManager(const NotificationCenter& notificationCenter);
  ~ResourceManager();
  Player* getPlayerForKey(int key);
  void notifyTestPlayer();
};

} // namespace core

#endif // CORE_RESOURCE_MANAGER_H_
