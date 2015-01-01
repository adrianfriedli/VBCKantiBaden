#include "core_player.h"
#include "core_player_observer.h"

namespace core {

Player::Player() {
  name_ = "my name";
}

std::string Player::name() {
  return name_;
}

void Player::addObserver(const PlayerObserver& observer) {
  // TODO: add observer
  observer.update(this);
}

void Player::removeObserver(const PlayerObserver& observer) {
  // TODO: remove observer
}

} // namespace core
