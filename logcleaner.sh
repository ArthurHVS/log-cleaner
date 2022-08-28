#!/bin/bash
#   Let's clean the logs periodically, with some fancy GUI prompts.
#
#   Author: Arthur Henrique <arthur.hvs@gmail.com>
#
#   Copyright (C) 2022 Arthur Henrique Verdadeiro Silva
#
#   This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later version
#
#   This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY of FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
#
LOG_FOLDER="/var/log"

SIZE=$(sudo du -h -d 0 $LOG_FOLDER | cut -f1)
zenity --width=400 --timeout=1800 --question --text="Estamos usando $SIZE de espaço para logs na partição /var.\nDeseja liberar esse espaço, apagando-os permanentemente?"
if [[ $? = 0 ]]; then
    sudo rm $LOG_FOLDER/*
    zenity --info --width=280 --timeout=4 --text="Seus logs foram apagados com sucesso!"
elif [[ $? = 1 ]]; then
    zenity --info --width=280 --timeout=4 --text="Seus logs não foram apagados..."
elif [[ $? = 5 ]]; then
    rm $LOG_FOLDER/*
    zenity --info --width=280 --timeout=4 --text="Seus logs foram apagados com sucesso!"
fi