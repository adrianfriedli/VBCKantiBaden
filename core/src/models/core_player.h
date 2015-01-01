#ifndef CORE_MODELS_CORE_PLAYER_H_
#define CORE_MODELS_CORE_PLAYER_H_

#include <string>

namespace core {

class PlayerObserver;
  
class Player {
private:
  std::string name_;

public:
  Player();

  std::string name();
  
  void addObserver(const PlayerObserver& observer);
  void removeObserver(const PlayerObserver& observer);
}; 

} // namespace core

#endif // CORE_MODELS_CORE_PLAYER_H_
