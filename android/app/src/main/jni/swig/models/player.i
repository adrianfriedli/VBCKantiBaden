%module(directors="1") models

%{
#include "core/models/core_player.h"
#include "core/models/core_player_observer.h"
%}

%feature("director") PlayerObserver;
%include "std_string.i"

%rename(NativePlayerObserver) PlayerObserver; 
%typemap(jstype) const core::PlayerObserver& "PlayerObserver";
%typemap(javainterfaces) PlayerObserver "PlayerObserver"
%typemap(javain,pgcppname="n",
         pre="    NativePlayerObserver n = models.makeNative($javainput);")
        const core::PlayerObserver&  "NativePlayerObserver.getCPtr(n)"

%include "core/models/core_player.h"
%include "core/models/core_player_observer.h"

%pragma(java) modulecode=%{
  private static class NativePlayerObserverProxy extends NativePlayerObserver {
    private PlayerObserver delegate;
    public NativePlayerObserverProxy(PlayerObserver i) {
      delegate = i;
    }

    public void update(Player player) {
      delegate.update(player);
    }
  }

  public static NativePlayerObserver makeNative(PlayerObserver o) {
    if (o instanceof NativePlayerObserver) {
      // If it already *is* a NativePlayerObserver don't bother wrapping it again
      return (NativePlayerObserver)o;
    }
    return new NativePlayerObserverProxy(o);
  }
%}

%pragma(java) jniclasscode=%{
  static {
    try {
        System.loadLibrary("models");
    } catch (UnsatisfiedLinkError e) {
      System.err.println("Native code library failed to load. \n" + e);
      System.exit(1);
    }
  }
%}
