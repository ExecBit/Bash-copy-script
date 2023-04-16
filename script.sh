#Домашнее задание
#Напиши скрипт на bash, который будет копировать все файлы из
#одной директории в другую, с проверкой наличия файла с таким же
#именем. Если файл с таким именем уже существует в целевой
#директории, то скрипт должен предложить пользователю перезаписать
#файл или пропустить его копирование. В конце скрипт должен
#вывести количество скопированных файлов и количество пропущенных
#файлов.
#Скрипт опубликовать на github.

#!/bin/bash

echo "The current directory is:"
pwd

echo "Please enter full path to directory which you want copy files:"

read dst_directory

copy_file=$(ls $pwd | wc -l)
skip_file=0

shopt -s lastpipe

    ls | while read v; do
            if [ -e $dst_directory/$v ]
                then
                echo "File $v already exist. Should copy? y/n"
                read -u 1 res 
                if [ $res = "y" ]
                    then 
                    cp -r $v $dst_directory 
                else 
                    ((skip_file+=1))
                    ((copy_file-=1))
                fi
            else 
                cp -r $v $dst_directory 
            fi
        done 

echo "$copy_file files copy and $skip_file files skipped";
