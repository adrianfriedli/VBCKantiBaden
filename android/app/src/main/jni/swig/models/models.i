%module models

%{
#include "core/models/core_player.h"
%}

%include "std_string.i"

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

