#ifndef CORE_MODELS_PLAYER_H_
#define CORE_MODELS_PLAYER_H_

#include <string>

class Player {
private:
  std::string name_;

public:
  Player();

  std::string name();
}; 

#endif // CORE_MODELS_PLAYER_H_
