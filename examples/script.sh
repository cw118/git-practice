#! /usr/bin/bash

# GET USER'S NAME AND GREET THEM
read -p "What's your name? " NAME

# CONDITION TO DETERMINE RESPONSE BASED ON INPUTTED NAME
if [ "$NAME" == "Carolyn" ]
then
    echo "Wow, we have the same name!"
else
    echo "Hello there, $NAME. Have a good day!"
fi

# FILE CONDITIONS
FILE="file.txt"

if [ -f "$FILE" ]
then
    echo "$FILE is an existing file:"
elif [ -d "$FILE" ]
then
    echo "$FILE is an existing directory"
else
    echo "$FILE is not a file or directory"
fi

# CASE STATEMENT AND OPENING A FILE
read -p "Would you like to edit this shell script? (Y/n) " ANS

case "$ANS" in
    [yY] | [yY][eE][sS])
        echo "Opening the script..."
        nano script.sh
        ;;
    [nN] | [nN][oO])
        echo "Continuing..."
        ;;
    *)
        echo "Please enter Y/yes or n/no"
        ;;
esac

# FOR LOOP
NAMES="Ron Bill Fred George Ginny Percy Charlie"
for NAME in $NAMES
    do
        echo "$NAME is a Weasley!"
done

# Examples/concepts based on Traversy Media's tutorial: https://www.youtube.com/watch?v=v-F3YLd6oMw
