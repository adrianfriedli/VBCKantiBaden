#include "core_player.h"

namespace core {

Player::Player(int key) {
  key_ = key;
  resourceId_ = 42;
  name_ = "my name";
}

int Player::key() {
  return key_;
}

int Player::resourceId() {
  return resourceId_;
}


std::string Player::name() {
  return name_;
}

} // namespace core
