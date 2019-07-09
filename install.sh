#!/bin/bash
mkdir -p /media/root/opt/{bin,share,etc}
cp install/opt/bin/nano /media/root/opt/bin
cp -r install/opt/share/nano /media/root/opt/share
echo "include /opt/share/nano/*.nanorc" > /media/root/opt/etc/nanorc
cd /media/root
tar -zcvf nano.tgz opt
