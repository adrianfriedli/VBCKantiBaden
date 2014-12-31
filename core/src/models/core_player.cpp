#include "core_player.h"

namespace core {

Player::Player() {
  name_ = "my name";
}

std::string Player::name() {
  return name_;
}

} // namespace core
