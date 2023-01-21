#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"


echo -e "\n\n~~Welcome to Number Guessing Game~~\n"

echo "Enter your username:"
read USERNAME
while [[ ${#USERNAME} -ge 22 ]]
  do 
    echo "username must less than 22 characters.\n"
    echo "Enter your username:"
    read USERNAME
done 

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
# echo $USER
if [[ -z $USER_ID ]] 
  then
    INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES ('$USERNAME') RETURNING user_id")
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    USER_ID=$(echo $INSERT_USER_RESULT | sed -E 's/ .*//g')
  else
    USER_GAMES_INFO="$($PSQL "SELECT COUNT(*), MIN(num_of_guess) FROM games WHERE user_id = $USER_ID")"
    echo $USER_GAMES_INFO | while read GAMES_PLAYED BAR BEST
      do
        echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST guesses."
      done
fi


SECRET_NUMBER=$(( $RANDOM%1000 + 1 ))
echo -e "\nGuess the secret number between 1 and 1000:"
read USER_NUMBER

NUM_OF_GUESS=1
while [[ $USER_NUMBER != $SECRET_NUMBER ]]
do
  if [[ ! $USER_NUMBER =~ ^[0-9]+$ ]]
    then
      echo "That is not an integer, guess again:"
      read USER_NUMBER
    else
    if [[ $USER_NUMBER -gt $SECRET_NUMBER ]]
    then
      NUM_OF_GUESS=$(($NUM_OF_GUESS + 1))
      echo -e "\nIt's lower than that, guess again:"
      read USER_NUMBER
    else
      NUM_OF_GUESS=$(($NUM_OF_GUESS + 1))
      echo -e "\nIt's higher than that, guess again:"
      read USER_NUMBER
    fi
  fi
done

INSERT_GAME=$($PSQL "INSERT INTO games(user_id, num_of_guess) VALUES($USER_ID, '$NUM_OF_GUESS')")

echo -e "\nYou guessed it in $NUM_OF_GUESS tries. The secret number was $SECRET_NUMBER. Nice job!"
