#!/usr/bin/bash
if pidof wlsunset; then
	killall -9 wlsunset
else
	wlsunset -l 33.02 -L -96.70	
fi

