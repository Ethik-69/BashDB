#!/bin/bash

write_to_file () {
    echo $key $arg
}

read_file () {
    echo $key $arg
}

delete_from_file () {
    echo $key $arg
}

while [[ $# -gt 0 ]]
do

    key="$1"
    arg="$2"

    case $key in
        -w)
            write_to_file $key $arg
            shift
            shift
            ;;
        -r)
            read_file $key $arg
            shift
            shift
            ;;
        -d)
            delete_from_file $key $arg
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
