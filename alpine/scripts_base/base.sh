#!/bin/ash

#update, cleaner , upgrade
UPDATE="apk update --no-cache"
UPGRADE="apk upgrade --no-cache"
INSTALL="apk --no-cache add --update"
CLEANUP="rm -rf /var/cache/apk/* && rm -rf /var/lib/apk/* && apk cache clean"

# Message End message
INSTALL_MSG="( Install package )"
UPDATE_MSG="( Update system )"
UPGRADE_MSG="( Upgrade system )"
CLEAN_MSG="( Start clean Cache )"

INSTALL_MSG_END=" ( Install package done ! )"
UPDATE_MSG_END=" ( Update done ! ) "
UPGRADE_MSG_END=" ( Upgrade done! ) "
CLEAN_MSG_END=" (Clean done ! ) "

# Style
style(){
    echo ""
}

load()
{
    sleep 10 & PID=$! #simulate a long process
    echo " IN PROGRESS!"
    printf "["
    # While process is running...
    while kill -0 $PID 2> /dev/null; do
        printf  "▉"
        sleep 1
    done
    printf "] \n"
}


# update
update(){
    style
    echo $UPDATE_MSG
    $UPDATE
    style
    echo $UPDATE_MSG_END
}

# upgrade
upgrade(){
    style
    echo $UPGRADE_MSG
    $UPGRADE
    style
    echo $UPGRADE_MSG_END
}

# clean
clean(){
    style
    echo $CLEAN_MSG
    style
    load
    style
    $CLEANUP
    echo $CLEAN_MSG_END
    style
}

# update and  upgrade and cleaner
update_sys(){
    style
    if [[  update > /dev/null ]]; then
        update
        upgrade
        #clean
    else
        echo " Alpine is up to date !"
    fi
    style
}

# Install Package
install_pack(){
    style
    if [[ PACK_DEFAULT ]]; then 
        echo $INSTALL_MSG
        style
        $INSTALL $PACK_DEFAULT
        echo $INSTALL_MSG_END
        style
    fi
}





