#ifndef CORE_MODELS_CORE_PLAYER_H_
#define CORE_MODELS_CORE_PLAYER_H_

#include <string>

namespace core {
  
class Player {
private:
  int key_;
  int resourceId_;
  std::string name_;

public:
  Player(int key);

  int key();
  int resourceId();
  std::string name();
}; 

} // namespace core

#endif // CORE_MODELS_CORE_PLAYER_H_
