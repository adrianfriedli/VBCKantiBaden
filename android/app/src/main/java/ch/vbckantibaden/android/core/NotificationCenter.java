package ch.vbckantibaden.android.core;

public interface NotificationCenter {
    public void notify(int resourceId, int key);
    public void notifyList(int resourceId);
}
