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