#!/bin/bash
set -e

sudo ufw disable

#sudo apt update && sudo apt upgrade -y

#sudo apt install -y wget curl gdebi-core desktop-base xscreensaver
#sudo apt install -y xfce4 xfce4-goodies

sudo apt-get update -y
#sudo apt-get install -y wget curl gdebi-core desktop-base xscreensaver xfce4 xfce4-goodies
sudo apt-get install -y \
    xvfb \
    xfce4 \
    xfce4-terminal \
    dbus-x11 \
    x11-xserver-utils
Xvfb :99 -screen 0 1920x1080x24 &
export DISPLAY=:99
startxfce4 &

echo "exec /usr/bin/xfce4-session" > ~/.chrome-remote-desktop-session

wget -O /tmp/chrome-remote-desktop.deb https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo gdebi -n /tmp/chrome-remote-desktop.deb
rm /tmp/chrome-remote-desktop.deb

wget -O /tmp/google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo gdebi -n /tmp/google-chrome.deb
rm /tmp/google-chrome.deb
