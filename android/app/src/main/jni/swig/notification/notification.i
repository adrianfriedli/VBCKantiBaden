%module(directors="1") notification

%{
#include "core/notification/core_notification_center.h"
%}

%feature("director") NotificationCenter;
%include "std_string.i"

%rename(NativeNotificationCenter) NotificationCenter; 
%typemap(jstype) const core::NotificationCenter& "NotificationCenter";
%typemap(javainterfaces) NotificationCenter "NotificationCenter"
%typemap(javain,pgcppname="n",
         pre="    NativeNotificationCenter n = notification.makeNative($javainput);")
        const core::NotificationCenter&  "NativeNotificationCenter.getCPtr(n)"

%include "core/notification/core_notification_center.h"

%pragma(java) modulecode=%{
  private static class NativeNotificationCenterProxy extends NativeNotificationCenter {
    private NotificationCenter delegate;
    public NativeNotificationCenterProxy(NotificationCenter nc) {
      delegate = nc;
    }

    public void notify(int resourceId, int key) {
      delegate.notify(resourceId, key);
    }
    
    public void notifyList(int resourceId) {
      delegate.notifyList(resourceId);
    }
  }

  public static NativeNotificationCenter makeNative(NotificationCenter nc) {
    if (nc instanceof NativeNotificationCenter) {
      // If it already *is* a NativeNotificationCenter don't bother wrapping it again
      return (NativeNotificationCenter)nc;
    }
    return new NativeNotificationCenterProxy(nc);
  }
%}

%pragma(java) jniclasscode=%{
  static {
    try {
        System.loadLibrary("notification");
    } catch (UnsatisfiedLinkError e) {
      System.err.println("Native code library failed to load. \n" + e);
      System.exit(1);
    }
  }
%}
