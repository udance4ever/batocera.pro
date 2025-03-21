#!/bin/bash

# get rom from generator: 
ROM="$(echo "$1")"

# check if *.psn 
chmod a+x /userdata/system/pro/ps3plus/extras/rev 2>/dev/null
if [[ "$(echo "$ROM" | /userdata/system/pro/ps3plus/extras/rev | cut -c 1-4 | /userdata/system/pro/ps3plus/extras/rev)" = ".psn" ]]; then 
ID="$(cat "$ROM" | head -n 1 | tr 'a-z' 'A-Z')"
ROM="/userdata/system/configs/rpcs3/dev_hdd0/game/$ID/USRDIR/EBOOT.BIN"
fi

# prepare logs: 
log1=/userdata/system/pro/ps3plus/log1.txt
log2=/userdata/system/pro/ps3plus/log2.txt
rm $log1 2>/dev/null; rm $log2 2>/dev/null

# prepare *.ai: 
chmod a+x /userdata/system/pro/ps3plus/rpcs3/rpcs3.AppImage

# get scale/resolution: 
SCALE=1
res=$(xrandr | grep " connected" | awk '{print $3}' | cut -d "x" -f1)
if [[ "$res" -le "3840" ]] && [[ "$res" -ge "2560" ]]; then
SCALE=1.25
fi 
if [[ "$res" -lt "2560" ]] && [[ "$res" -ge "1920" ]]; then
SCALE=1.0
fi 
if [[ "$res" -lt "1920" ]] && [[ "$res" -ge "1280" ]]; then
SCALE=0.75
fi 
if [[ "$res" -lt "1280" ]]; then
SCALE=0.5
fi 

# start appimage: 
if [[ "$(echo "$ROM" | grep "CONFIG")" != "" ]] || [[ "$(echo "$ROM")" = "" ]]; then
unclutter-remote -s; 
DISPLAY=:0.0 \
QT_FONT_DPI=128 \
QT_SCALE_FACTOR=$SCALE \
XDG_CONFIG_HOME=/userdata/system/configs \
XDG_CACHE_HOME=/userdata/saves \
XDG_RUNTIME_DIR=/userdata \
QT_QPA_PLATFORM=xcb \
/userdata/system/pro/ps3plus/rpcs3/rpcs3.AppImage -platform xcb 1>$log1 2>$log2
else 
DISPLAY=:0.0 \
QT_FONT_DPI=128 \
QT_SCALE_FACTOR=$SCALE \
XDG_CONFIG_HOME=/userdata/system/configs \
XDG_CACHE_HOME=/userdata/saves \
XDG_RUNTIME_DIR=/userdata \
QT_QPA_PLATFORM=xcb \
/userdata/system/pro/ps3plus/rpcs3/rpcs3.AppImage -platform xcb --no-gui "$ROM" 1>$log1 2>$log2
fi

sleep 1
/userdata/system/pro/ps3plus/extras/boost.sh 2>/dev/null & 

