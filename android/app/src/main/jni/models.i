%module models
%include "std_string.i"

%{
#include "models/player.h"
%}

/* Let's just grab the original header file here */
%include "models/player.h"
