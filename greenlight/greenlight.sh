#!/usr/bin/env bash 
# BATOCERA.PRO INSTALLER
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
#--------------------------------------------------------------------- 
#       DEFINE APP INFO >>
APPNAME=greenlight 
APPLINK=https://github.com/uureel/batocera.pro/raw/main/greenlight/extra/Greenlight-2.0.0-beta4.AppImage
APPHOME="github.com/unknownskl/xbox-xcloud-client"
#---------------------------------------------------------------------
#       DEFINE LAUNCHER COMMAND >>
COMMAND='mkdir /userdata/system/pro/'$APPNAME'/home 2>/dev/null; mkdir /userdata/system/pro/'$APPNAME'/config 2>/dev/null; mkdir /userdata/system/pro/'$APPNAME'/roms 2>/dev/null; LD_LIBRARY_PATH="/userdata/system/pro/.dep:${LD_LIBRARY_PATH}" HOME=/userdata/system/pro/'$APPNAME'/home XDG_CONFIG_HOME=/userdata/system/pro/'$APPNAME'/config QT_SCALE_FACTOR="1" GDK_SCALE="1" XDG_DATA_HOME=/userdata/system/pro/'$APPNAME'/home DISPLAY=:0.0 /userdata/system/pro/'$APPNAME'/'$APPNAME'.AppImage --no-sandbox --disable-gpu "$1" "$2" "$3" "$4" "$5" "$6" "$7" "$8" "$9"'
#--------------------------------------------------------------------- 
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
# --------------------------------------------------------------------
APPNAME="${APPNAME^^}"; ORIGIN="${APPHOME^^}"; appname=$(echo "$APPNAME" | awk '{print tolower($0)}'); AppName=$appname; APPPATH=/userdata/system/pro/$appname/$AppName.AppImage
# --------------------------------------------------------------------
# --------------------------------------------------------------------
# show console/ssh info: 
clear
echo
echo
echo
echo -e "${X}PREPARING $APPNAME INSTALLER, PLEASE WAIT . . . ${X}"
echo
echo
echo
echo
# --------------------------------------------------------------------
# -- output colors:
###########################
X='\033[0m'               # 
W='\033[0m'               # 
#-------------------------#
RED='\033[0m'             # 
BLUE='\033[0m'            # 
GREEN='\033[0m'           # 
PURPLE='\033[0m'          # 
DARKRED='\033[0m'         # 
DARKBLUE='\033[0m'        # 
DARKGREEN='\033[0m'       # 
DARKPURPLE='\033[0m'      # 
###########################
# --------------------------------------------------------------------
# -- console theme
L=$X
R=$X
# --------------------------------------------------------------------
# -- prepare paths and files for installation: 
cd ~/
pro=/userdata/system/pro
mkdir $pro 2>/dev/null
mkdir $pro/extra 2>/dev/null
mkdir $pro/$appname 2>/dev/null
mkdir $pro/$appname/extra 2>/dev/null
# --------------------------------------------------------------------
# -- pass launcher command as cookie for main function: 
command=$pro/$appname/extra/command; rm $command 2>/dev/null;
echo "$COMMAND" >> $command 2>/dev/null 
# --------------------------------------------------------------------
# -- prepare dependencies for this app and the installer: 
url=https://github.com/uureel/batocera.pro/raw/main/.dep
depfile=dependencies.txt; dep=$pro/.dep; mkdir $pro/.dep 2>/dev/null; cd $dep
wget -q -O $dep/$depfile $url/$depfile 2>/dev/null; dos2unix $dep/$depfile;
nl=$(cat $dep/$depfile | wc -l); l=1; while [[ "$l" -le "$((nl+2))" ]]; do
d=$(cat $dep/$depfile | sed ""$l"q;d"); wget -q -O $dep/$d $url/$d 2>/dev/null; 
if [[ "$(echo $d | grep "lib")" != "" ]]; then ln -s $dep/$d /lib/$d 2>/dev/null; fi; ((l++)); done
wget -q -O $pro/$appname/extra/icon.png https://github.com/uureel/batocera.pro/raw/main/$appname/extra/icon.png; chmod a+x $dep/tput; cd ~/
# --------------------------------------------------------------------
# // end of dependencies 
#
# --------------------------------------------------------------------
# -- run before installer:  
killall wget 2>/dev/null && killall $AppName 2>/dev/null && killall $AppName 2>/dev/null && killall $AppName 2>/dev/null
# --------------------------------------------------------------------
cols=$($dep/tput cols); rm -rf /userdata/system/pro/$appname/extra/cols
echo $cols >> /userdata/system/pro/$appname/extra/cols
line(){
  local start=1
  local end=${1:-80}
  local str="${2:-=}"
  local range=$(seq $start $end)
  for i in $range ; do echo -n "${str}"; done
}
# -- show console/ssh info: 
clear
echo
echo
echo
echo -e "${X}BATOCERA.PRO/$APPNAME INSTALLER${X}"
echo
echo
echo
echo
sleep 0.33
clear
echo
echo
line $cols '-'; echo
echo -e "${X}BATOCERA.PRO/$APPNAME INSTALLER${X}"
line $cols '-'; echo
echo
echo
echo
sleep 0.33
clear
echo
line $cols '-'; echo
line $cols ' '; echo
echo -e "${X}BATOCERA.PRO/$APPNAME INSTALLER${X}"
line $cols ' '; echo
line $cols '-'; echo
echo
echo
sleep 0.33
clear
line $cols '\'; echo
line $cols '/'; echo
line $cols ' '; echo
echo -e "${X}BATOCERA.PRO/$APPNAME INSTALLER${X}"
line $cols ' '; echo
line $cols '/'; echo
line $cols '\'; echo
echo
sleep 0.33
echo -e "${X}THIS WILL INSTALL XBOX-XCLOUD-CLIENT FOR BATOCERA"
echo -e "${X}USING $ORIGIN"
echo
echo -e "${X}$APPNAME WILL BE AVAILABLE IN PORTS"
echo -e "${X}AND ALSO IN THE F1->APPLICATIONS MENU"
echo -e "${X}AND INSTALLED IN /USERDATA/SYSTEM/PRO/$APPNAME"
echo
echo -e "${X}FOLLOW THE BATOCERA DISPLAY"
echo
echo -e "${X}. . .${X}" 
echo
#/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
# --------------------------------------------------------------------
#\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
# -- THIS WILL BE SHOWN ON MAIN BATOCERA DISPLAY:   
function batocera-pro-installer {
APPNAME="$1"
appname="$2"
AppName="$3"
APPPATH="$4"
APPLINK="$5"
ORIGIN="$6"
# --------------------------------------------------------------------
# -- colors: 
###########################
X='\033[0m'               # 
W='\033[0m'               # 
#-------------------------#
RED='\033[0m'             # 
BLUE='\033[0m'            # 
GREEN='\033[0m'           # 
PURPLE='\033[0m'          # 
DARKRED='\033[0m'         # 
DARKBLUE='\033[0m'        # 
DARKGREEN='\033[0m'       # 
DARKPURPLE='\033[0m'      # 
###########################
# -- display theme:
L=$W
T=$W
R=$RED
B=$BLUE
G=$GREEN
P=$PURPLE
# --------------------------------------------------------------------
cols=$(cat /userdata/system/pro/.dep/display.cfg | tail -n 1)
cols=$(bc <<<"scale=0;$cols/1.3") 2>/dev/null
#cols=$(cat /userdata/system/pro/$appname/extra/cols | tail -n 1)
line(){
  local start=1
  local end=${1:-80}
  local str="${2:-=}"
  local range=$(seq $start $end)
  for i in $range ; do echo -n "${str}"; done
}
clear
echo
echo
echo
echo -e "${W}BATOCERA.PRO/${G}$APPNAME${W} INSTALLER ${W}"
echo
echo
echo
echo
sleep 0.33
clear
echo
echo
echo
echo -e "${W}BATOCERA.PRO/${W}$APPNAME${W} INSTALLER ${W}"
echo
echo
echo
echo
sleep 0.33
clear
echo
echo
line $cols '-'; echo
echo -e "${W}BATOCERA.PRO/${G}$APPNAME${W} INSTALLER ${W}"
line $cols '-'; echo
echo
echo
echo
sleep 0.33
clear
echo
line $cols '-'; echo
echo; #line $cols '-'; echo
echo -e "${W}BATOCERA.PRO/${W}$APPNAME${W} INSTALLER ${W}"
echo; #line $cols '-'; echo
line $cols '-'; echo
echo
echo
sleep 0.33
clear
line $cols '='; echo
echo; #line $cols '-'; echo
echo; #line $cols '-'; echo
echo -e "${W}BATOCERA.PRO/${G}$APPNAME${W} INSTALLER ${W}"
echo; #line $cols '-'; echo
echo; #line $cols '-'; echo
line $cols '='; echo
echo
sleep 0.33
echo -e "${W}THIS WILL INSTALL XBOX-XCLOUD-CLIENT FOR BATOCERA"
echo -e "${W}USING $ORIGIN"
echo
echo -e "${W}$APPNAME WILL BE AVAILABLE IN PORTS"
echo -e "${W}AND ALSO IN THE F1->APPLICATIONS MENU"
echo -e "${W}AND INSTALLED IN /USERDATA/SYSTEM/PRO/$APPNAME"
echo
echo -e "${R}> > > ${W}PRESS ENTER TO CONTINUE"
read -p ""
echo; #line $cols '='; echo
# --------------------------------------------------------------------
# -- check system before proceeding
if [[ "$(uname -a | grep "x86_64")" != "" ]]; then 
:
else
echo
echo -e "${RED}ERROR: SYSTEM NOT SUPPORTED"
echo -e "${RED}YOU NEED BATOCERA X86_64${X}"
echo
sleep 5
exit 0
# quit
exit 0
fi
# --------------------------------------------------------------------
# -- temp for curl download
pro=/userdata/system/pro
temp=/userdata/system/pro/$appname/extra/downloads
rm -rf $temp 2>/dev/null
mkdir -p $temp 2>/dev/null
# --------------------------------------------------------------------
# DOWNLOAD 86BOX: 
echo -e "${G}DOWNLOADING${W}"
sleep 1
echo -e "${T}$APPLINK" | sed 's,https://,> ,g' | sed 's,http://,> ,g' 2>/dev/null
cd $temp
curl --progress-bar --remote-name --location "$APPLINK"
cd ~/
mv $temp/* $APPPATH 2>/dev/null
chmod a+x $APPPATH 2>/dev/null
rm -rf $temp/*.AppImage
SIZE=$(($(wc -c $APPPATH | awk '{print $1}')/1048576)) 2>/dev/null
echo -e "${T}$APPPATH ${T}$SIZE( )MB ${G}OK${W}" | sed 's/( )//g'
#echo -e "${G}> ${W}DONE"
echo
echo; #line $cols '='; echo
sleep 1.333
# --------------------------------------------------------------------
echo -e "${G}INSTALLING${W}"
# --------------------------------------------------------------------
# -- prepare launcher to solve dependencies on each run and avoid overlay, 
launcher=/userdata/system/pro/$appname/Launcher
rm -rf $launcher
echo '#!/bin/bash ' >> $launcher
echo 'unclutter-remote -s' >> $launcher
## -- GET APP SPECIFIC LAUNCHER COMMAND: 
######################################################################
echo "$(cat /userdata/system/pro/$appname/extra/command)" >> $launcher
######################################################################
dos2unix $launcher
chmod a+x $launcher
rm /userdata/system/pro/$appname/extra/command 2>/dev/null
# --------------------------------------------------------------------
# -- prepare f1 - applications - app shortcut, 
shortcut=/userdata/system/pro/$appname/extra/$appname.desktop
rm -rf $shortcut 2>/dev/null
echo "[Desktop Entry]" >> $shortcut
echo "Version=1.0" >> $shortcut
echo "Icon=/userdata/system/pro/$appname/extra/icon.png" >> $shortcut
echo "Exec=/userdata/system/pro/$appname/Launcher" >> $shortcut
echo "Terminal=false" >> $shortcut
echo "Type=Application" >> $shortcut
echo "Categories=Game;batocera.linux;" >> $shortcut
echo "Name=$appname" >> $shortcut
f1shortcut=/usr/share/applications/$appname.desktop
dos2unix $shortcut
chmod a+x $shortcut
cp $shortcut $f1shortcut 2>/dev/null
# --------------------------------------------------------------------
# -- prepare Ports file, 
version=$(echo $APPLINK | sed 's,^.*Greenlight-,,g' | sed 's,.AppImage,,g')
port=/userdata/system/pro/$appname/Greenlight.sh
rm -rf $port 2>/dev/null 
echo '#!/bin/bash ' >> $port
echo ' dep=/userdata/system/pro/.dep; depfile=$dep/dependencies.txt; ' >> $port
echo ' nl=$(cat $depfile | wc -l); l=1; while [[ "$l" -le "$((nl+2))" ]]; do ' >> $port
echo ' d=$(cat $depfile | sed ""$l"q;d"); if [[ "$(echo $d | grep "lib")" != "" ]]; then ' >> $port
echo ' ln -s $dep/$d /lib/$d 2>/dev/null; fi; ((l++)); done ' >> $port
echo 'unclutter-remote -s' >> $port
echo 'mkdir /userdata/system/pro/'$appname'/home 2>/dev/null' >> $port
echo 'mkdir /userdata/system/pro/'$appname'/config 2>/dev/null' >> $port
echo 'mkdir /userdata/system/pro/'$appname'/roms 2>/dev/null' >> $port
echo 'HOME=/userdata/system/pro/'$appname'/home \' >> $port
echo 'XDG_DATA_HOME=/userdata/system/pro/'$appname'/home \' >> $port
echo 'XDG_CONFIG_HOME=/userdata/system/pro/'$appname'/config \' >> $port
echo 'QT_SCALE_FACTOR="1" GDK_SCALE="1" \' >> $port
echo 'DISPLAY=:0.0 /userdata/system/pro/'$appname'/'$appname'.AppImage --no-sandbox' >> $port
dos2unix $port 
chmod a+x $port 
ports=/userdata/roms/ports
if [[ -e "$ports/Greenlight.sh" ]]; 
then 
  if [[ "$(cat "$ports/Greenlight.sh" | grep "/userdata/system/pro/greenlight" | tail -n 1)" != "" ]]; 
  then 
  cp $port "$ports/Greenlight.sh"
  else
  cp $port "$ports/Greenlight $version.sh";
  fi
else cp $port "$ports/Greenlight.sh"; 
fi
# --------------------------------------------------------------------
# -- prepare prelauncher to avoid overlay,
pre=/userdata/system/pro/$appname/extra/startup
rm -rf $pre 2>/dev/null
echo "#!/usr/bin/env bash" >> $pre
echo "cp /userdata/system/pro/$appname/extra/$appname.desktop /usr/share/applications/ 2>/dev/null" >> $pre
dos2unix $pre
chmod a+x $pre
# -- add prelauncher to custom.sh to run @ reboot
csh=/userdata/system/custom.sh
if [[ -e $csh ]] && [[ "$(cat $csh | grep "/userdata/system/pro/$appname/extra/startup")" = "" ]]; then
echo -e "\n/userdata/system/pro/$appname/extra/startup" >> $csh
fi
if [[ -e $csh ]] && [[ "$(cat $csh | grep "/userdata/system/pro/$appname/extra/startup" | grep "#")" != "" ]]; then
echo -e "\n/userdata/system/pro/$appname/extra/startup" >> $csh
fi
if [[ -e $csh ]]; then :; else
echo -e "\n/userdata/system/pro/$appname/extra/startup" >> $csh
fi
dos2unix $csh
# -- done. 
sleep 1
echo -e "${G}> ${W}DONE${W}"
echo
sleep 1
echo; #line $cols '='; echo
echo -e "${W}> $APPNAME INSTALLED ${G}OK${W}"
line $cols '='; echo
echo "1" >> /userdata/system/pro/$appname/extra/status 2>/dev/null
sleep 3
# reaload for ports file
curl http://127.0.0.1:1234/reloadgames
}
export -f batocera-pro-installer 2>/dev/null
# --------------------------------------------------------------------
# RUN:
# |
  batocera-pro-installer "$APPNAME" "$appname" "$AppName" "$APPPATH" "$APPLINK" "$ORIGIN" 2>/dev/null
# --------------------------------------------------------------------
# BATOCERA.PRO INSTALLER //
##########################
exit 0