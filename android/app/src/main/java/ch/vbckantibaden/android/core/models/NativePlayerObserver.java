/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 3.0.2
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package ch.vbckantibaden.android.core.models;

public class NativePlayerObserver {
  private long swigCPtr;
  protected boolean swigCMemOwn;

  protected NativePlayerObserver(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  protected static long getCPtr(NativePlayerObserver obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  protected void finalize() {
    delete();
  }

  public synchronized void delete() {
    if (swigCPtr != 0) {
      if (swigCMemOwn) {
        swigCMemOwn = false;
        modelsJNI.delete_NativePlayerObserver(swigCPtr);
      }
      swigCPtr = 0;
    }
  }

  protected void swigDirectorDisconnect() {
    swigCMemOwn = false;
    delete();
  }

  public void swigReleaseOwnership() {
    swigCMemOwn = false;
    modelsJNI.NativePlayerObserver_change_ownership(this, swigCPtr, false);
  }

  public void swigTakeOwnership() {
    swigCMemOwn = true;
    modelsJNI.NativePlayerObserver_change_ownership(this, swigCPtr, true);
  }

  public void update(Player player) {
    modelsJNI.NativePlayerObserver_update(swigCPtr, this, Player.getCPtr(player), player);
  }

  public NativePlayerObserver() {
    this(modelsJNI.new_NativePlayerObserver(), true);
    modelsJNI.NativePlayerObserver_director_connect(this, swigCPtr, swigCMemOwn, true);
  }

}
