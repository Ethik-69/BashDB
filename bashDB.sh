#!/bin/bash


write_to_file () {
    # Write $data into file ($file_name)
    check_file_exist $file_name
    check_if_entry_is_in $data $file_name

    # Check the exit status of the last command
    if [ $? == 0 ]
    then
        # Replace $line by $data in file ($file_name)
        sed -i "s|$line|$data|" $file_name
        echo "Updated"
    else
        echo $data >> $file_name
        echo "Added"
    fi
}


read_file () {
    # Find the line with $data in and echo it
    grep -w $data $file_name
    if [ $? -gt 0 ];
    then
        echo "You'r doing shit man ! Try again !"
    fi
}


delete_from_file () {
    check_if_entry_is_in $data $file_name
    if [ $? == 0 ]
    then
        # Delete the whole line
        sed -i "/$line/d" $file_name
        echo "Entry deleted !"
    else
        echo "You'r doing shit man ! Try again !"
    fi
}


check_if_entry_is_in () {
    name=$(echo $data | cut -d= -f 1)
    line=$(grep -w $name $file_name)
}


check_file_exist () {
    # Check if the file ($file_name) exist,
    # if not touch it (You know what i mean ;) )
    if [ ! -e $file_name ]
    then
        echo $file_name' do not exist ! Oh My F****** God !'
        touch $file_name
        echo 'File Touched !'
    fi
}


interactif_loop () {
    while true
    do
        echo 'What do you want to do ? (q for quit)'
        read user_cmd
        # Get the command writed by the user
        # and the data
        cmd=$(echo $user_cmd | cut -d' ' -f 1)
        data=$(echo $user_cmd | cut -d' ' -f 2)

        case $cmd in
            write)
                write_to_file $data $file_name
                ;;
            read)
                read_file $data $file_name
                ;;
            delete)
                delete_from_file $data $file_name
                ;;
            q)
                exit 0
                ;;
            *)
                echo 'Try again !'
                ;;
        esac
    done
}


while [[ $# -gt 0 ]]
do
    # Get $# (the number of params)
    ar=$#
    # Get the value of the last params
    file_name=${!ar}

    key="$1"
    data="$2"

    case $key in
        -w)
            write_to_file $data $file_name
            shift
            shift
            ;;
        -r)
            read_file $data $file_name
            shift
            shift
            ;;
        -d)
            delete_from_file $data $file_name
            shift
            shift
            ;;
        *.db)
            interactif_loop $file_name
            shift
            ;;
         *)
            echo 'Try again !'
            shift
            ;;
    esac
done
