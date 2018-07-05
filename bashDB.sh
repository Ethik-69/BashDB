#!/bin/bash


write_to_file () {
    check_file_exist $file_name
    echo $arg $file_name
}


read_file () {
    echo $arg $file_name
}


delete_from_file () {
    echo $arg $file_name
}


check_file_exist () {
    if [ ! -e $file_name ]
    then
        echo $file_name' do not exist ! Oh My F****** God !'
        touch $file_name
        echo 'File Touched !'
    fi
}


while [[ $# -gt 0 ]]
do
    ar=$#
    file_name=${!ar}

    key="$1"
    arg="$2"

    case $key in
        -w)
            write_to_file $arg $file_name
            shift
            shift
            ;;
        -r)
            read_file $arg $file_name
            shift
            shift
            ;;
        -d)
            delete_from_file $arg $file_name
            shift
            shift
            ;;
        *.db)
            echo 'fucking db files !'
            shift
            ;;
         *)
            echo 'Try again !'
            shift
            ;;
    esac
done
