#!/bin/bash
#script written by romeo manuel e. david.
#  _____  __  ____   __   _____ ____  _   _ ______ _____ _____ 
# |  __ \|  \/  \ \ / /  / ____/ __ \| \ | |  ____|_   _/ ____|
# | |__) | \  / |\ V /  | |   | |  | |  \| | |__    | || |  __ 
# |  _  /| |\/| | > <   | |   | |  | | . ` |  __|   | || | |_ |
# | | \ \| |  | |/ . \  | |___| |__| | |\  | |     _| || |__| |
# |_|  \_\_|  |_/_/ \_\  \_____\____/|_| \_|_|    |_____\_____|
#                                                              
                                                              
fx_print_init(){
    echo "Welcome to RMX Automated WAHFFLE configurator"
    echo "To view this command's man page, type 'rmxconfig --man'"
}
fx_print_xml(){

cat <<EOT > ./config.xml
    <?xml version="1.0"?>
<config>
    <node>
        <name>$FACILITYNAME</name>
        <code>$CODE</code>
        <telephone></telephone>
        <level>self</level>
        <hfid>$HFID</hfid>
        <accred>$ACCRED</accred>
        <prc>$PRC</prc>
        <lastname>$LASTNAME</lastname>
        <firstname>$FIRSTNAME</firstname>
        <middlename>$MIDDLENAME</middlename>
        <suffix>NA</suffix>
        <wkey>$WKEY</wkey>
        <ekey>$EKEY</ekey>
        <wsdl>https://119.92.200.12/webservice/index.php?wsdl</wsdl>
    </node>
    <node>
        <name>$FACILITYNAME</name>
        <code>$CODE</code>
        <telephone></telephone>
        <level>parent</level>
        <hfid>$HFID</hfid>
    </node>
    <node>
        <name>$FACILITYNAME</name>
        <code>$CODE</code>
        <telephone></telephone>
        <level>childf</level>
        <hfid>$HFID</hfid>
    </node>
</config>
EOT
}
fx_proceed(){
    echo "create database $SQLDBNAME; " > configsql.sql
    echo "use $SQLDBNAME;" >> configsql.sql
    mysql -uroot -proot < configsql.sql

    msyql -uroot -proot $SQLDBNAME
    sed -i -e 's/'"placeholder"'/'"$SQLDBNAME"'/g' _dbselect.php

}
fx_out_all(){
    echo ""
    echo ""
    echo "Review all inputs before proceeding."
    echo "Health Facility Name: $FACILITYNAME" 
    echo "Folder Name: /var/www/$FOLDERNAME" 
    echo "SQL Link: $SQLLINK"
    read -p "Press ENTER key to proceed to config.xml. Press Ctrl + C to abort"
    cat ./config.xml
    echo ""
    echo "================="
    read -e -p "Is everything ok? [y/n]: " DECISION
    if [[ "$DECISION" == "y" ]]; then
        fx_proceed()
    else
        echo "Bye nigga."
        exit 1
    fi
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
fx_do_get_vars(){
    echo "Welcome to RMX Automated WAHFFLE configurator"
    echo "Input what is asked! No Erasures please"

    #read facility name
    read -e -p "Health Facility Name: " FACILITYNAME
    
    #create /var/www/folder
    read -e -p "/var/www folder name: " FOLDERNAME
    #mv /var/www/wahmapandan /var/www/$FOLDERNAME
    
    #get sql link
    read -e -p "Full SQL link: " SQLLINK

    #config SQL
    read -e -p "Full SQL DB Name: " SQLDBNAME

    #config xml
    read -e -p "BRGY CODE WITH 0: " CODE
    read -e -p "HF ID: " HFID
    read -e -p "ACCREDITATION ID: " ACCRED
    read -e -p "PRC CODE: " PRC
    read -e -p "MHO LAST NAME: " LASTNAME
    read -e -p "MHO FIRST NAME: " FIRSTNAME
    read -e -p "MHO MIDDLE NAME: " MIDDLENAME
    read -e -p "WKEY: " WKEY
    read -e -p "ENCRYPTION KEY: " EKEY
    fx_out_all()
}

if [ -z "$1" ]; then
    fx_print_init
fi
if [ -n "$1" ]; then
    if [ "$1" == "--man" ]; then
        fx_print_man
    else
        if [ "$1" == "--iamhorny" ]; then
            fx_do_get_vars
        else
            fx_print_init
        fi
    fi
fi

