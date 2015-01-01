#ifndef CORE_MODELS_CORE_PLAYER_OBSERVER_H_
#define CORE_MODELS_CORE_PLAYER_OBSERVER_H_

namespace core {

class Player;

class PlayerObserver {
public:
    virtual void update(Player* player) const = 0;
    virtual ~PlayerObserver() {}
};

} // namespace core

#endif // CORE_MODELS_CORE_PLAYER_OBSERVER_H_

