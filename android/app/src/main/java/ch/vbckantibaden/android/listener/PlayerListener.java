package ch.vbckantibaden.android.listener;

import ch.vbckantibaden.android.core.Player;

public interface PlayerListener extends ModelListener {
    public void playerChanged(Player player);
}
