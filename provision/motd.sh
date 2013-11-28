echo "$(tput setaf 7)
 _   _               _                _    _          
( ) ( )             ( )            _ (_ ) (_ )        
| |_| |   _ _   ___ | |__   _   _ (_) | |  | |    __  
|  _  | /'_' )/',__)|  _ '|( ) ( )| | | |  | |  /'__'\ 
| | | |( (_| |\__, \| | | || \_/ || | | |  | | (  ___/ 
(_) (_)'\__,_)(____/(_) (_)'\___/'(_)(___)(___)'\____)
"
let upSeconds="$(/usr/bin/cut -d. -f1 /proc/uptime)"
let secs=$((${upSeconds}%60))
let mins=$((${upSeconds}/60%60))
let hours=$((${upSeconds}/3600%24))
let days=$((${upSeconds}/86400))
UPTIME=`printf "%d days, %02dh%02dm%02ds" "$days" "$hours" "$mins" "$secs"`
read one five fifteen rest < /proc/loadavg
echo -e "$(tput setaf 3)
Uptime.............: ${UPTIME}
Memory.............: `cat /proc/meminfo | grep MemFree | awk {'print $2'}`kB (Free) / `cat /proc/meminfo | grep MemTotal | awk {'print $2'}`kB (Total)
Load Averages......: ${one}, ${five}, ${fifteen} (1, 5, 15 min)
IP Addresses.......: `ifconfig | awk '/dr:/{gsub(/.*:/,"",$2);printf " " $2}'` $(tput sgr0)\n"
