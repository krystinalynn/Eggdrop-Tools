# Eggdrop-Tools
Tools to make living with an eggy, easier.

## mkbot.sh
A script to make bots symlinked to a single updateable core.

#### Usage Instructions
* Download, Configure and Build eggdrop from source in your home directory.
* Download and run this script.
* Specify the username of the account that was used to build the bot.
* Follow the on-screen instructions.

This script will take the core you've built and symlink it to create new bots.
If you need to update your bots, just update the core! The update filters down to your bots.

## mkconf.sh
A script to make a quick conf file for eggdrop bots.

#### Usage Instructions
* Download and run this script.
* Follow the on-screen instructions.
* After the script has finished, a new folder will be created in your /home directory with the name of your bot. Inside of this folder, you will find your bot.conf file. Move it to wherever your eggdrop directory is located, then start your bot with ./eggdrop -m bot.conf
