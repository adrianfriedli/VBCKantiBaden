/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 3.0.2
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package ch.vbckantibaden.android.core;

public class ResourceManager {
  private long swigCPtr;
  protected boolean swigCMemOwn;

  protected ResourceManager(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  protected static long getCPtr(ResourceManager obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  protected void finalize() {
    delete();
  }

  public synchronized void delete() {
    if (swigCPtr != 0) {
      if (swigCMemOwn) {
        swigCMemOwn = false;
        coreJNI.delete_ResourceManager(swigCPtr);
      }
      swigCPtr = 0;
    }
  }

  static private long SwigConstructResourceManager(NotificationCenter notificationCenter) {
    NativeNotificationCenter n = core.makeNative(notificationCenter);
    return coreJNI.new_ResourceManager(NativeNotificationCenter.getCPtr(n), n);
  }

  public ResourceManager(NotificationCenter notificationCenter) {
    this(ResourceManager.SwigConstructResourceManager(notificationCenter), true);
  }

  public Player getPlayerForKey(int key) {
    long cPtr = coreJNI.ResourceManager_getPlayerForKey(swigCPtr, this, key);
    return (cPtr == 0) ? null : new Player(cPtr, true);
  }

  public void notifyTestPlayer() {
    coreJNI.ResourceManager_notifyTestPlayer(swigCPtr, this);
  }

}
