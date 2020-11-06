#!/bin/bash

function update {
	echo 'updating utils'
	sudo apt -y update
	sudo apt -y upgrade
}

function clean {
	echo 'cleaning'
	sudo apt -y autoclean autoremove
}

function install {
	echo 'installing utils'
	sudo apt update
	sudo apt install vim tmux htop gcc git gitk meld net-tools cmake make
	sudo apt install openjdk-8-jdk maven
}

function ask_type {

    while : 
    do
	TYPE='NOTSET'

	RET=$(whiptail --title "Select" --menu "chose a type" 10 78 4 \
		"UPDATE" "update utils" \
		"INSTALL" "install utils"\
		"CLEAN" "clean"	\
		"EXIT" "quit this window" \
		3>&1 1>&2 2>&3)

	if [ $? -ne 0 ]; then 
		echo "operation has been canceled"
		return 1;
	fi

	if [ "$RET" == "UPDATE" ]; then 
		#TYPE="UPDATE"
		update
	elif [ "$RET" == "INSTALL" ]; then
                #TYPE="INSTALL"
                install		
	elif [ "$RET" == "CLEAN" ]; then 
		clean 
	elif [ "$RET == EXIT" ]; then 
              	return 0;
	else 
		echo "failure"
		return 1;
	fi

	echo "done at HH:MM:SS"
    done
}

function run {
	if [ -z $1 ]
	then 
		ask_type || exit
	fi
}

run
