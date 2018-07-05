#!/bin/bash


write_to_file () {
    check_file_exist $file_name
    check_if_entry_is_in $arg $file_name
    if [ $? == 0 ]
    then
        sed -i "s|$line|$arg|" $file_name
        echo "Updated"
    else
        echo $arg >> $file_name
        echo "Added"
    fi
}


read_file () {
    grep -w $arg $file_name
    if [ $? -gt 0 ];
    then
        echo "You'r doing shit man ! Try again !"
    fi
}


delete_from_file () {
    check_if_entry_is_in $arg $file_name
    if [ $? == 0 ]
    then
        sed -i "s|$line||" $file_name
        echo "Entry deleted !"
    else
        echo "You'r doing shit man ! Try again !"
    fi
}


check_if_entry_is_in () {
    name=$(echo $arg | cut -d= -f 1)
    line=$(grep $name $file_name)
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
