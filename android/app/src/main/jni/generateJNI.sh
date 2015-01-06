#!/bin/bash

#models:
swig3.0 -c++ -java -package ch.vbckantibaden.android.core -outdir ../java/ch/vbckantibaden/android/core -o swig/models/models_wrap.cpp swig/models/models.i

#notification:
#swig3.0 -c++ -java -package ch.vbckantibaden.android.core.notification -outdir ../java/ch/vbckantibaden/android/core/notification -o swig/notification/notification_wrap.cpp swig/notification/notification.i

#core:
swig3.0 -c++ -java -package ch.vbckantibaden.android.core -outdir ../java/ch/vbckantibaden/android/core -o swig/core_wrap.cpp swig/core.i
