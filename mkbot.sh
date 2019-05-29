#!/bin/bash
# Make symbolically linked eggdrop bots.
# REQUIRES EGGDROP BE COMPILED ALREADY.
red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m'
blu=$'\e[1;34m'
mag=$'\e[1;35m'
cyn=$'\e[1;36m'
end=$'\e[0m'
clear
eggsrc() { 
 echo ${yel}Changing Directory:${end} /home/$botaccount/eggdrop
 cd /home/$botaccount/eggdrop
}
echo ${yel}==================================${end}
echo ${blu}Symlink bot-setup script v1.0${end}
echo ${yel}----------------------------------${end}
echo ${mag}by QueenElsa${end}
echo ${yel}==================================${end}
echo 
echo This script will create a shared symlink bot for you. A symlink
echo bot uses a single eggdrop install to run multiple bots. To update
echo a symlink bot, you merely need to update the main eggdrop install. 
echo then symlink the new eggdrop executable into each bot directory. 
echo This helps reduce redundancy and increases efficency with regards to 
echo updating your eggdrop bots. 
echo 
echo ${yel}To get started, please tell me the username of the account that will
echo run your bot. ${red}This is critical, as this script will rely on this for 
echo all further actions. ${end}
echo 
echo ${yel}Make sure you already have eggdrop compiled in the home directory for
echo that username. All files should be in the /eggdrop folder. ${end}
echo 
echo "${blu}So, what's the username of the account that will run this bot?${end}"
read botaccount
clear
echo Now, please give me a unique name for this bot.
echo
echo You should use this format: Network_Nick 
echo for example, on Undernet Olaf is named: Undernet_Olaf
echo "but this isn't necessary. It just helps keep things neat for you if you have"
echo multiple bots. 
echo 
echo ${blu}What is your unique name for this bot?${end}
read botname
nb() { 
 echo ${yel}Changing Directory:${end} /home/$botaccount/$botname
 cd /home/$botaccount/$botname
}
echo 
echo ${blu}GREAT! I shall now create $botname for you.${end}
echo 
mkdir $botname
eggsrc
mkbt() { 
echo ${cyn}Now preparing to link the eggdrop core... please wait.${end}
ln -s /home/$botaccount/eggdrop/doc/ /home/$botaccount/$botname
ln -s /home/$botaccount/eggdrop/eggdrop /home/$botaccount/$botname
ln -s /home/$botaccount/eggdrop/eggdrop-1.8.4 /home/$botaccount/$botname
ln -s /home/$botaccount/eggdrop/help/ /home/$botaccount/$botname
ln -s /home/$botaccount/eggdrop/language/ /home/$botaccount/$botname
ln -s /home/$botaccount/eggdrop/modules/ /home/$botaccount/$botname
ln -s /home/$botaccount/eggdrop/modules-1.8.4 /home/$botaccount/$botname
ln -s /home/$botaccount/eggdrop/README /home/$botaccount/$botname
ln -s /home/$botaccount/eggdrop/text/ /home/$botaccount/$botname
echo ${cyn}Core linked - creating critical bot directories... please wait.${end}
}
mkbt
nb
mkbt2() {
mkdir filesys
mkdir logs
mkdir scripts
}
mkbt2
clear
eggdrop() { 
 echo "${grn}  
  ______ _____  _____ _____  _____   ____  _____  
 |  ____/ ____|/ ____|  __ \|  __ \ / __ \|  __ \ 
 | |__ | |  __| |  __| |  | | |__) | |  | | |__) |
 |  __|| | |_ | | |_ | |  | |  _  /| |  | |  ___/ 
 | |___| |__| | |__| | |__| | | \ \| |__| | |     
 |______\_____|\_____|_____/|_|  \_\\_____/|_| 
 --------------------------------------------------- ${end}
 "
}
clear
echo ${grn}Your bot should be prepared BUT it has no configuration files available for use.${end}
read -p "${blu}Would you like to create a configuration file? (y/n)?${end} " CONF
if [ "$CONF" = "y" ]; then
  clear
  echo ${red}STOP • STOP • STOP • STOP • STOP • STOP
  echo "
  ███████╗████████╗ ██████╗ ██████╗ 
  ██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗
  ███████╗   ██║   ██║   ██║██████╔╝
  ╚════██║   ██║   ██║   ██║██╔═══╝ 
  ███████║   ██║   ╚██████╔╝██║     
  ╚══════╝   ╚═╝    ╚═════╝ ╚═╝     
  "
  echo ${red}STOP • STOP • STOP • STOP • STOP • STOP
  echo 
  echo
  echo "If you have never setup an eggdrop before, go read the documentation." 
  echo "It will save you from many future headaches. It will also help developers"
  echo "should you need to ask for help.${end}"
  echo 
  echo "${yel}Setting up an eggdrop isn't an easy task. While this script will assist you,"
  echo "it won't teach you."
  echo 
  echo "Before you embark on your eggdrop journey - it is strongly recommended that you"
  echo "learn some basic linux skills if you don't already have them. There is an entire"
  echo "community that will assist you if you have a genuine problem and have made genuine"
  echo "attempts to resolve your problem. They won't, however, hold your hand.${end}"
  echo 
  echo "The documentation for eggdrop can be found at ${blu}http://docs.eggheads.org/${end}"
  echo 
  read -n 1 -s -r -p "Press any key to continue the setup script."
  clear
  eggdrop
  echo "This utility will assist you in creating a basic configuration for your bot." 
  echo "It will not enable advanced options. If you need information on what each setting"
  echo "in your generated conf file does - please refer to the eggdrop.conf file inside"
  echo "of your eggdrop directory." 
  echo
  #Open file descriptor
  exec 3<> /home/$botaccount/$botname/$botname.conf
  #Set eggdrop hashbang
  echo "#! /home/$botaccount/$botname/eggdrop" >&3
  echo -e '
  #  ______ _____  _____ _____  _____   ____  _____  
  # |  ____/ ____|/ ____|  __ \|  __ \ / __ \|  __ \ 
  # | |__ | |  __| |  __| |  | | |__) | |  | | |__) |
  # |  __|| | |_ | | |_ | |  | |  _  /| |  | |  ___/ 
  # | |___| |__| | |__| | |__| | | \ \| |__| | |     
  # |______\_____|\_____|_____/|_|  \_\\_____/|_|  
  ' >&3
  #Set information for user to read.
  echo >&3
  echo >&3
  echo "#If you don't know how to configure this file, refer to the eggdrop.conf file located in /home/$botaccount/eggdrop to see the help comments." >&3
  echo "#If that doesn't help you - read the eggdrop documentation at eggheads.org" >&3
  echo "#And if that fails to assist - you probably shouldn't be running an eggdrop bot yet." >&3
  echo -e "#---------------" >&3
  echo "#Generated by QueenElsa's configuration utility script." >&3
  echo >&3
  echo >&3
  #Ident
  echo "What ident should this bot use? This setting has no effect if an ident daemon is running on your bot's machine."
  echo
  read ident
  echo set username '"'$ident'"' >&3
  #Admin Info
  clear
  eggdrop
  echo
  echo
  echo "Provide contact information for this bot's administrator."
  echo "This setting defines which contact person should be shown in .status, /msg help, and other places."
  echo 
  read admin 
  echo -e set admin '"'$admin'"' >&3
  clear
  #Network Info
  eggdrop
  echo
  echo
  echo "What network will your bot connect to?"
  echo "${mag}Example: irc.undernet.org${end}"
  echo 
  read network 
  echo -e set network '"'$network'"' >&3
  clear
  #Timezone
  eggdrop
  echo
  echo
  echo "What timezone is your bot in?"
  echo "${mag}Example: EST${end}"
  echo 
  read tz
  echo -e set timezone '"'$tz'"' >&3
  clear
  #Offset
  eggdrop
  echo
  echo
  echo "What is the UTC offset for your timezone?"
  echo "${yel}The offset is positive if the local timezone is west of the Prime Meridian and negative if it is east."
  echo "The value (in hous) must be between -23 and 23. For example, if the timezone is UTC+1 the offset is -1.${end}"
  echo 
  read offset
  echo -e set offset '"'$offset'"' >&3
  clear
  #Listen Address
  eggdrop
  echo
  echo
  echo "Please type your server's IPv4 address. Your bot will bind to this address."
  echo 
  read vhost4
  echo -e set vhost4 '"'$vhost4'"' >&3
  echo -e set listen-addr '"'$vhost4'"' >&3
  clear
  #MaxLogs
  eggdrop
  echo
  echo
  echo "How many logfiles may be open at one time?"
  echo "${yel}This value should be set to the maximum number of channels you expect to create logfiles for."
  echo "${red}Never set this below 5.${yel} Any future decreases of this value will require a restart of your bot.${end}" 
  echo 
  read maxlogs
  echo set max-logs $maxlogs >&3
  clear
  #MaxLogs-Size
  eggdrop
  echo
  echo
  echo "What should the max size of your logfiles be?"
  echo "${yel}This value determines how your bot will cycle it's logs."
  echo "For example, if this value is set to 550, your bot will cycle logs once a log reaches 550 kilobytes in size."
  echo "If this is set to 0, it will be disabled.${end}"
  echo 
  read maxlogsize
  echo set max-logsize $maxlogsize >&3
  clear
  #Underused Settings
  echo "set quick-logs 0" >&3
  echo "set raw-log 0" >&3
  #Enable General Logging
  eggdrop
  echo
  echo
  read -p "Would you like to log privmsgs, ctcp events, commands, errors and miscellaneous information from all channels your bot is joined to? (y/n) " alllog
  if [ "$alllog" = "y" ]; then
    echo "logfile mco * logs/$botname.log" >&3
  else
    echo "${red}Your bot will not log anything.${end}";
  fi
  echo "set log-time 1" >&3
  echo "set timestamp-format \{\[%H:%M:%S\]\}" >&3
  echo "set keep-all-logs 0" >&3
  echo set logfile-suffix '"'.%d%b%Y'"' >&3
  echo "set switch-logfiles-at 300" >&3
  echo "set quiet-save 0" >&3;
  clear
  #Define console modes
  eggdrop
  echo
  echo
  read -p "Would you like to define your own default console modes? (y/n) " conmode
  if [ "$conmode" = "y" ]; then 
    echo "What are the default console modes would you like to set?"
    echo 
	read sconmode
	echo set console '"'$sconmode'"' >&3
  else 
    echo "${red}You chose to use the default console modes.${end}"
	echo set console '"mkcoblxs"' >&3
  fi
  clear
  #Files and Directories
  echo set userfile '"'$botname.user'"' >&3
  echo set pidfile '"'pid.$botname'"' >&3
  echo set help-path '"'help/'"' >&3
  echo set text-path '"'text/'"' >&3
  echo set motd '"'text/motd'"' >&3
  echo set telnet-banner '"'text/banner'"' >&3
  echo "set userfile-perm 0600" >&3
  eggdrop
  echo
  echo
  echo "What port would you like your bot to listen on for bots and telnet users?"
  echo 
  read telnet
  echo listen $telnet all >&3
  clear
  #More under-used settings 
  echo "set remote-boots 2" >&3
  echo "set share-unlinks 1" >&3
  echo "set protect-telnet 0" >&3
  echo "set dcc-sanitycheck 0" >&3
  echo "set ident-timeout 5" >&3
  echo "set require-p 1" >&3
  echo "set open-telnets 0" >&3
  echo "set stealth-telnets 0" >&3
  echo set stealth-prompt '"\n\nNickname.\n"' >&3
  echo "set use-telnet-banner 0" >&3
  echo "set connect-timeout 15" >&3
  echo "set dcc-flood-thr 3" >&3
  echo "set telnet-flood 5:60" >&3
  echo "set paranoid-telnet-flood 1" >&3
  echo "set ignore-time 15" >&3
  echo "set hourly-update 00" >&3
  echo set notify-newusers '"'$owner'"' >&3
  echo set default-flags '"'hp'"' >&3
  echo set whois-fields '"'url birthday'"' >&3
  echo "set must-be-owner 1" >&3
  echo "unbind dcc n simul *dcc:simul" >&3
  echo "set max-socks 100" >&3
  echo "set allow-dk-commands 1" >&3
  echo "set dupwait-timeout 5" >&3
  echo "set strict-host 1" >&3
  echo "set cidr-support 1" >&3
  echo set mod-path '"'modules/'"' >&3
  echo "loadmodule blowfish" >&3
  echo "set blowfish-use-mode ecb" >&3
  echo "loadmodule dns" >&3
  echo "set dns-cache 86400" >&3
  echo "set dns-negcache 600" >&3
  echo "set dns-maxsends 4" >&3
  echo "set dns-retrydelay 3" >&3
  echo "loadmodule channels" >&3
  echo set chanfile '"'$botname.chan'"' >&3
  echo "set force-expire 0" >&3
  echo "set share-greet 0" >&3
  echo "set use-info 1" >&3
  echo "set allow-ps 0" >&3
  echo "set default-flood-chan 15:60" >&3
  echo "set default-flood-deop 3:10" >&3
  echo "set default-flood-kick 3:10" >&3
  echo "set default-flood-join 5:60" >&3
  echo "set default-flood-ctcp 3:60" >&3
  echo "set default-flood-nick 5:60" >&3
  echo "set default-aop-delay 5:30" >&3
  echo "set default-idle-kick 0" >&3
  echo set default-chanmode '"'nt'"' >&3
  echo "set default-stopnethack-mode 0" >&3
  echo "set default-revenge-mode 0" >&3
  echo "set dafault-ban-type 3" >&3
  echo "set default-ban-time 120" >&3
  echo "set default-exempt-time 60" >&3
  echo "set default-invite-time 60" >&3
  echo "set default-chanset {
        -autoop         -autovoice
        -bitch          +cycle
        +dontkickops    +dynamicbans
        +dynamicexempts +dynamicinvites
        -enforcebans    +greet
        -inactive       -nodesynch
        -protectfriends +protectops
        -revenge        -revengebot
        -secret         -seen
        +shared         -statuslog
        +userbans       +userexempts
        +userinvites    -protecthalfops
        -autohalfop     -static
  }" >&3
  echo "loadmodule server" >&3
  #Network
  eggdrop
  echo
  echo
  echo "What is your network?"
  echo "${yel}0 = EFNet${end}"
  echo "${yel}1 = IRCNet${end}"
  echo "${yel}2 = Undernet${end}"
  echo "${yel}3 = DALNet${end}"
  echo "${yel}4 = +e/+I/max-modes 20 Hybrid${end}"
  echo "${yel}5 = Others${end}"
  echo 
  read net
  echo set net-type $net >&3
  clear
  #Bot Nick
  eggdrop
  echo
  echo
  echo "What nick should your bot use on IRC?"
  echo 
  read bnick 
  echo set nick '"'$bnick'"' >&3
  clear
  #Alt Nick
  eggdrop
  echo
  echo
  echo "If that nick isn't available, what alt nick should your bot use?"
  echo 
  read altnick 
  echo set altnick '"'$altnick'"' >&3
  clear
  #Real Name
  eggdrop
  echo
  echo
  echo "What should your bot's Real Name/GECOS be?"
  echo 
  read realname
  echo set realname '"'$realname'"' >&3
  clear
  echo 'bind evnt - init-server evnt:init_server
  
  proc evnt:init_server {type} {
    global botnick
	putquick "MODE $botnick +ix-ws"
  }' >&3 
  echo "set default-port 6667" >&3
  #Set Servers
  eggdrop
  echo
  echo
  read -p "Eggdrop is generally useless if it's not on an IRC server unless it is acting as a hub-bot. Would you like to specify an IRC Server to connect to? (y/n) " ircs
  if [ "$ircs" = "y" ]; then
    echo "${cyn}Please specify the server address you'd like to connect to.${end}"
	echo "${mag}Example:${end} irc.undernet.org:6667"
	echo "${mag}Example #2:${end} znc.ircnetwork.org:7000:user/ircnet:password"
    echo 
	read svr
	echo set servers '{' $svr '}' >&3
  else
    echo "${red}Your bot will not log anything.${end}";
  fi
  clear
  echo "set msg-rate 2" >&3  
  echo "set keep-nick 1" >&3
  echo "set quiet-reject 1" >&3
  echo "set lowercase-ctcp 0" >&3
  echo "set answer-ctcp 3" >&3
  echo "set flood-msg 5:60" >&3
  echo "set flood-ctcp 3:60" >&3
  echo "set server-cycle-wait 60" >&3
  echo "set server-timeout 60" >&3
  echo "set check-stoned 1" >&3
  echo "set serverror-quit 1" >&3
  echo "set max-queue-msg 300" >&3
  echo "set trigger-on-ignore 0" >&3
  echo "set exclusive-binds 0" >&3
  echo "set double-mode 1" >&3
  echo "set double-help 1" >&3
  echo "set optimize-kicks 1" >&3
  echo "set stack-limit 4" >&3
  echo "loadmodule ctcp" >&3
  echo "set ctcp-mode 0" >&3
  echo "loadmodule irc" >&3
  echo "set bounce-bans 0" >&3
  echo "set bounce-exempt 0" >&3 
  echo "set bounce-invites 0" >&3
  echo "set bounce-modes 0" >&3
  echo "set max-bans 30" >&3
  echo "set max-exempts 20" >&3
  echo "set max-invites 20" >&3
  echo "set max-modes 30" >&3
  echo "set learn-users 0" >&3
  echo "set wait-split 600" >&3
  echo "set wait-info 180" >&3
  echo "set mode-buf-length 200" >&3
  echo "unbind msg - ident *msg:ident" >&3
  echo "unbind msg - addhost *msg:addhost" >&3
  echo set opchars '"@&~"' >&3
  echo "set no-chanrec-info 0" >&3
  echo "set prevent-mixing" >&3
  echo "#loadmodule transfer" >&3 
  echo "set max-dloads 3" >&3
  echo "set dcc-block 0" >&3    
  echo "set copy-to-tmp 1" >&3
  echo "set xfer-timeout 30" >&3
  echo "#loadmodule compress" >&3
  echo "set share-compressed 1" >&3
  echo "#loadmodule filesys" >&3
  echo set files-path '"'/home/$botaccount/$botname/filesys'"' >&3
  echo set incoming-path '"'/home/$botaccount/$botname/filesys/incoming'"' >&3
  echo "set upload-to-pwd 0" >&3
  echo set filedb-path '""' >&3
  echo "set max-file-users 20" >&3
  echo "set max-filesize 1024" >&3
  echo "loadmodule notes" >&3
  echo set notefile '"'$botname.notes'"' >&3
  echo "set max-notes 50" >&3
  echo "set note-life 60" >&3
  echo "set allow-fwd 0" >&3
  echo "set notify-users 0" >&3
  echo "set notify-onjoin 1" >&3
  echo "if {[file exists aclocal.m4]} { die {You are attempting Eggdrop from the source directory. Please finish installing Eggdrop by running make install and run it from the install location.} }" >&3
  echo "loadmodule console" >&3
  echo "set console-autosave 1" >&3
  echo "set force-channel 0" >&3
  echo "set info-party 0" >&3
  echo "loadmodule seen" >&3
  echo "loadmodule uptime" >&3
  #Scripts
  eggdrop
  echo
  echo
  read -p "Eggdrop is a powerful bot. This power can be further extended through use of scripts. Is there a script you'd like to install? (y/n) " sinstall
  if [ "$sinstall" = "y" ]; then
	clear
	echo "${red} 
	███████╗████████╗ ██████╗ ██████╗ 
	██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗
	███████╗   ██║   ██║   ██║██████╔╝
	╚════██║   ██║   ██║   ██║██╔═══╝ 
	███████║   ██║   ╚██████╔╝██║     
	╚══════╝   ╚═╝    ╚═════╝ ╚═╝ ${end}"
	echo 
	echo Make sure your scripts are placed into /home/$botaccount/$botname/scripts
	echo
	echo
	read -n 1 -s -r -p "Press any key to continue the installation"
	clear
    echo "#Scripts" >&3
	echo "#Use this section to load scripts into your bot." >&3
	echo 
	echo "What script would you like to install?"
    echo 
	read instscript
	echo source scripts/$instscript >&3
	clear
	echo "Remember, you need to place this script into /home/$botaccount/$botname/scripts if you haven't already done so."
  else
    clear
    echo "${red}You have chosen not to install any scripts into your bot.${end}";
	echo "#Scripts" >&3
	echo "#Use this section to load scripts into your bot." >&3
  fi
  clear
  exec 3>&- 
  echo -e "${grn}
  ███████╗██╗███╗   ██╗██╗███████╗██╗  ██╗███████╗██████╗ 
  ██╔════╝██║████╗  ██║██║██╔════╝██║  ██║██╔════╝██╔══██╗
  █████╗  ██║██╔██╗ ██║██║███████╗███████║█████╗  ██║  ██║
  ██╔══╝  ██║██║╚██╗██║██║╚════██║██╔══██║██╔══╝  ██║  ██║
  ██║     ██║██║ ╚████║██║███████║██║  ██║███████╗██████╔╝
  ╚═╝     ╚═╝╚═╝  ╚═══╝╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚═════╝  
  "
  echo "${grn}Now you should have a configuration file for your bot. However, you'll still need to create your userfile. To do this, run ${yel}./eggdrop -m $botname${grn} inside of your newly created bot directory. ${end}"
  echo 
else
  clear
  echo -e "${red}
  ███╗   ██╗ ██████╗      ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗ 
  ████╗  ██║██╔═══██╗    ██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝ 
  ██╔██╗ ██║██║   ██║    ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗
  ██║╚██╗██║██║   ██║    ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║
  ██║ ╚████║╚██████╔╝    ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝
  ╚═╝  ╚═══╝ ╚═════╝      ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝  
  "
  echo "${red}You chose not to make any configuration files for your bot.${end}";
  echo "If you change your mind, you're going to need to run this script again.";
  echo
  echo "${red}Just make sure you don't have an ${yel}eggdrop.conf${end} ${red} file, should you decide to do this.${end}";
  echo 
fi
