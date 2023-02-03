#!/bin/bash

echo "Provisioning script $0"

username=batagiev
userpassword=1

encpassword=`openssl passwd -1 ${userpassword}`

id -u $username
if [[ $? ]]
then
    adduser -G wheel -p ${encpassword} ${username}
    homedir=`getent passwd ${username} | cut -d: -f6`
    echo "export PS1='[\u@\H \W]\\n\$ '" >> ${homedir}/.bashrc
fi


