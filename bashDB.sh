#!/bin/bash

case $1 in
    -w)
        echo 'Write' ;;
    -r)
        echo 'read' ;;
    -d)
        echo 'delete' ;;
    *)
        echo 'Try again !' ;;
    esac




