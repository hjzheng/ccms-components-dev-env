#!/bin/bash

__create_user() {
# Create a user to SSH into as.
useradd xianfe
SSH_USERPASS=xianfe
echo -e "$SSH_USERPASS\n$SSH_USERPASS" | (passwd --stdin xianfe)
echo ssh xianfe password: $SSH_USERPASS

echo -e "$SSH_USERPASS\n$SSH_USERPASS" | passwd
echo ssh root password: $SSH_USERPASS
}

# https://github.com/CentOS/CentOS-Dockerfiles/blob/master/ssh/centos7/README.md
# Call all functions
__create_user