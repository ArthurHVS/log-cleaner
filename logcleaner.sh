#!/bin/bash

SIZE=$(sudo du -h -d 0 /var/log | cut -f1)
zenity --width=400 --timeout=1800 --question --text="Estamos usando $SIZE de espaço para logs na partição /var.\nDeseja liberar esse espaço, apagando-os permanentemente?"
if [[ $? = 0 ]]; then
    sudo rm ./var/log/*
elif [[ $? = 1 ]]; then
    zenity --info --width=280 --timeout=4 --text="Seus logs não foram apagados!"
elif [[ $? = 5 ]]; then
    rm ./test-logs/*
fi