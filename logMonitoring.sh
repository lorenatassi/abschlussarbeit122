#!/bin/bash                                    logMonitoring.sh                                                # Aufruf: logMonitoring.sh logfilepfad mail
#
#logMonitoring.sh
#Parameter : logfilepfad & mail
#Autor: Lorena Tassi
#Datum: 25.01.2021
#

#Testen ob Parameter gegeben sind
if [[ ! -f "$1" ]] || [[ ! -f "$2" ]]; then
        echo "Es gab ein Fehler >        exit
fi

#file lesen und filtern
tail -f $1 | grep -E "((WARNING)|(INFO)|(ERROR))" | while read line

do

#linie ins mail schreiben
echo "$line" | mail -s error_found $2
done


#Um alles in ein File zu schreiben statt per E-Mail zu senden (mit dem oberen tail austauschen)
#tail -f $1 | grep -E "((WARNING)|(INFO)|(ERROR))" > C:/Users/loren/OneDrive/Desktop/Modul122/Errors.txt