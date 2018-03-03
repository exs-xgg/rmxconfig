#!/bin/bash
#script written by romeo manuel e. david.

fx_print_init(){
    echo "Welcome to RMX Automated WAHFFLE configurator"
    echo "To view this command's man page, type 'rmxconfig --man'"
}
fx_print_man(){
    echo "Welcome to RMX Automated WAHFFLE configurator"
    echo "This script automates most of the process configuration including MySQL configuration and folder config."
    echo "To use this script, just run it with the --iamhorny parameter and input all the required fields."
    echo ""
    echo "No erasures please. Abort this script using Ctrl + C and start over."
    echo "Example usage:"
    echo "# ./rmxconfig.sh --iamhorny"
    echo "Health Facitlty Name: Zamboanga District Health Center 2"
    echo "/var/www folder name: wahzamboanga2"
    echo "Full SQL link: ~/Downloads/zamboanga2060917.sql"
}
fx_do_main(){
    echo "Welcome to RMX Automated WAHFFLE configurator"
    echo "Input what is asked!"
    echo "Health Facility Name:" 
    read FACILITYNAME
    
    #create /var/www/folder
    echo "/var/www folder name"
    read FOLDERNAME
    mv /var/www/wahmapandan /var/www/{$FOLDERNAME}
    
    echo "Full SQL link:"
    read SQLLINK
    echo ""
}
if [ -z "$1" ]; then
    fx_print_init
fi
if [ -n "$1" ]; then
    if [ "$1" == "--man" ]; then
        fx_print_man
    else
        if [ "$1" == "--iamhorny" ]; then
            fx_do_main
        else
            fx_print_init
        fi
    fi
fi

