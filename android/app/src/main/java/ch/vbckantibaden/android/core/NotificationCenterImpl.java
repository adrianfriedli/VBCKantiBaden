package ch.vbckantibaden.android.core;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import ch.vbckantibaden.android.listener.ModelListener;
import ch.vbckantibaden.android.listener.PlayerListener;

public class NotificationCenterImpl implements NotificationCenter {

    private static final class InstanceHolder {
        static final NotificationCenterImpl INSTANCE = new NotificationCenterImpl();
    }

    public static NotificationCenterImpl getInstance () {
        return InstanceHolder.INSTANCE;
    }

    private Map<ModelObserverKey, ModelObserver> observers = new ConcurrentHashMap<>();

    private NotificationCenterImpl () {}

    @Override
    public void notify(int resourceId, int key) {
        for (ModelObserver observer : observers.values()) {
            if (observer.isInterested(resourceId, key)) {
                observer.notifyListener();
            }
        }
    }

    @Override
    public void notifyList(int resourceId) {

    }

    public void addPlayerListener(final PlayerListener listener, final Player player) {
        ModelObserverKey observerKey = new ModelObserverKey(listener, player.resourceId(), player.key());
        observers.put(observerKey, new ModelObserver(observerKey) {
            @Override
            protected void notifyListener() {
                listener.playerChanged(player);
            }
        });
    }

    public void removePlayerListener(final PlayerListener listener, final Player player) {
        removeModelListener(listener, player.resourceId(), player.key());
    }

    private void removeModelListener(ModelListener listener, int resourceId, int key) {
        ModelObserverKey observerKey = new ModelObserverKey(listener, resourceId, key);
        observers.remove(observerKey);
    }

    private class ModelObserverKey {
        private ModelListener listener;
        private int resourceId;
        private int key;

        public ModelObserverKey(ModelListener listener, int resourceId, int key) {
            this.listener = listener;
            this.resourceId = resourceId;
            this.key = key;
        }

        @Override
        public boolean equals(Object o) {
            if (o == null || !(o instanceof ModelObserverKey)) {
                return false;
            }
            ModelObserverKey other = (ModelObserverKey)o;
            return listener.equals(other.listener) && resourceId == other.resourceId && key == other.key;
        }

        @Override
        public int hashCode() {
            int hash = listener.hashCode();
            hash += 31 * hash + resourceId;
            return 31 * hash + key;
        }
    }

    private abstract class ModelObserver {
        protected ModelObserverKey key;

        protected ModelObserver(ModelObserverKey key) {
            this.key = key;
        }

        protected boolean isInterested(int resourceId, int key) {
            return resourceId == this.key.resourceId && key == this.key.key;
        }

        protected abstract void notifyListener();
    }
}
