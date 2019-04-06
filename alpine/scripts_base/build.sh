#!/bin/ash

# Add script function
source /root/.script_base/base

# time zone docker
TIME=${TIMEZONE}


#echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
#echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

# Add pack
PACK_DEFAULT="  vim zsh openrc htop curl git zip unzip openssh autoconf \
                ca-certificates openssl dpkg-dev dpkg ssmtp xvfb dbus tzdata
            "

# update system
update_sys

# install pakage
install_pack

# install zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Setting timezone
echo $TIME
cp /usr/share/zoneinfo/$TIME /etc/localtime
echo "$TIME" > /etc/timezone

# clean system
clean