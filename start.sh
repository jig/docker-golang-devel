#!/bin/bash
# Adapted from blog entry by Fabio Rehm:
#   http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/

if ! grep -q "^$UNAME:" /etc/passwd; then
    echo Creating contained user $UNAME
    echo "$UNAME:x:$UID:$GID:Developer,,,:/home/$UNAME:/bin/bash" >> /etc/passwd 
    echo "$UNAME:x:$UID:" >> /etc/group
    mkdir -p /etc/sudoers.d
    echo "$UNAME ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$UNAME 
    chmod 0440 /etc/sudoers.d/$UNAME 
else
    echo User $UNAME already contained
fi

runuser -u $UNAME "/usr/local/liteide/bin/liteide"
