# Setup
* Simply clone this repo and install expect: ```sudo apt-get install expect```

# Usage
* In order to be run mach_install.sh must be run with an argument indicating the program to be installed. ie ./mach_install.sh tmux
* This program also requires expect to be installed on the machine it is running on.
* This program assumes a .secrets file which defines an environment variable PASSWORD which will be used to log into all of the machines.
* This program also assumes a user named labmin, this is currently hardcoded into the expect.sh file on line 9.
* Finally, this program needs expects a .servers.txt file which has contains either DNS names or the ip adresses of the servers it will be connecting to.
