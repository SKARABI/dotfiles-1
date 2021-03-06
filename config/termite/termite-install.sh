#!/usr/bin/env sh
# https://github.com/Corwind/termite-install

git clone --recursive https://github.com/thestinger/termite.git

git clone https://github.com/thestinger/vte-ng.git

-- -- 

sudo apt-get install g++ libgtk-3-dev gtk-doc-tools gnutls-bin valac

sudo apt-get install libglib3.0-cil-dev libgnutls28-dev libgirepository1.0-dev

sudo apt-get install libxml2-utils gperf

-- -- 

cd vte-ng && ./autogen.sh && make && sudo make install

-- -- 

cd ../termite && make && sudo make install

sudo desktop-file-install termite.desktop

sudo cp /usr/local/lib/libvte-2.91.a /usr/local/lib/libvte-2.91.la \
/usr/local/lib/libvte-2.91.so /usr/local/lib/libvte-2.91.so.0 \
/usr/local/lib/libvte-2.91.so.0.4400.1 /usr/lib

sudo mkdir -p /lib/terminfo/x; sudo ln -s \
/usr/local/share/terminfo/x/xterm-termite \
/lib/terminfo/x/xterm-termite


-- --

If you have trouble with xfce4-terminal, simply remove symbolic link.

rm /usr/local/lib/libvte-2.91.la \
/usr/local/lib/libvte-2.91.so /usr/local/lib/libvte-2.91.so.0 \
/usr/lib/libvte-2.91.so.0.4400.1
