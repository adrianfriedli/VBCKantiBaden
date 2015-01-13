package ch.vbckantibaden.android;

import ch.vbckantibaden.android.core.NotificationCenter;
import ch.vbckantibaden.android.core.NotificationCenterImpl;
import ch.vbckantibaden.android.listener.PlayerListener;
import ch.vbckantibaden.android.core.ResourceManager;
import ch.vbckantibaden.android.core.Player;

public class Test implements PlayerListener {

    NotificationCenter mNotificationCenter;
    ResourceManager mResourceManager;

    public Test() {
        mNotificationCenter = NotificationCenterImpl.getInstance();
        mResourceManager = new ResourceManager(mNotificationCenter);
        System.out.println("init succeeded");
        Player player = mResourceManager.getPlayerForKey(123);
        player.addListener(this);
        mResourceManager.notifyTestPlayer(); // should trigger
        player.removeListener(this);
        mResourceManager.notifyTestPlayer(); // should not trigger
        System.out.println("test finished");
    }

    @Override
    public void playerChanged(Player player) {
        System.out.println("Yes, we can! (" + player.key() + ")");
    }
}
