%module models

%{
#include "core/models/core_player.h"
#include <memory>
%}

%include "std_string.i"
%include <std_shared_ptr.i>
%shared_ptr(core::Player)

%typemap(javaimports) core::Player "import ch.vbckantibaden.android.listener.$javaclassnameListener;"

%typemap(javacode) core::Player %{
  public void addListener($javaclassnameListener listener) {
    NotificationCenterImpl.getInstance().add$javaclassnameListener(listener, this);
  }
  
  public void removeListener($javaclassnameListener listener) {
    NotificationCenterImpl.getInstance().remove$javaclassnameListener(listener, this);
  }
%}

%include "core/models/core_player.h"

