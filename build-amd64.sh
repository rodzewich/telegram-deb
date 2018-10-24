#!/usr/bin/env bash

wget https://dl.tlgrm.click/desktop/linux -O ./telegram.tar.xz;
rm -rf ./telegram/usr/share/telegram;
tar -xf telegram.tar.xz --directory ./telegram/usr/share --wildcards Telegram/*;
unlink ./telegram.tar.xz;
mv ./telegram/usr/share/Telegram ./telegram/usr/share/telegram;
mv ./telegram/usr/share/telegram/Telegram ./telegram/usr/share/telegram/telegram;
mv ./telegram/usr/share/telegram/Updater ./telegram/usr/share/telegram/updater;
chmod 755 ./telegram/usr/share/telegram/telegram;
chmod 755 ./telegram/usr/share/telegram/updater;
fakeroot dpkg-deb --build telegram;
mv telegram.deb telegram_1.0_amd64.deb