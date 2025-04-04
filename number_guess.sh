#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MAIN_MENU() {
  echo -e "\n~~~~~ Number Guessing Game ~~~~~\n"

  # get username
  echo "Enter your username:"
  read USERNAME

  # get user from db
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME';")

  if [[ $USER_ID ]]
  then
    # get number of games played
    GAMES_PLAYED=$($PSQL "SELECT count(user_id) FROM games WHERE user_id = $USER_ID;")

    # get best game
    BEST_GAME=$($PSQL "SELECT min(guesses) FROM games WHERE user_id = $USER_ID;")

    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  else
    # new user
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
    
    # create user
    INSERT_USER_RESULT=$($PSQL "INSERT INTO users (name) VALUES ('$USERNAME');")

    # get user from db
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME';")
  fi

  GAME

}

GAME () {
  # Number to guess
  RESULT=$((1 + $RANDOM % 1000))
  # echo $RESULT

  # tries
  TRIES=0

  # guess
  GUESSED=0
  echo -e "\nGuess the secret number between 1 and 1000:"

  while [[ $GUESSED = 0 ]]
  do
    read GUESS
    if [[ ! $GUESS =~ ^[0-9]+$ ]]
    then
      echo -e "\nThat is not an integer, guess again:"
    else
      TRIES=$(($TRIES + 1))
      if [[ $RESULT = $GUESS ]]
      then
        echo -e "\nYou guessed it in $TRIES tries. The secret number was $RESULT. Nice job!"
        INSERT_GAME_RESULT=$($PSQL "INSERT INTO games (user_id, guesses) VALUES ($USER_ID, $TRIES);")
        GUESSED=1
      elif [[ $RESULT -gt $GUESS ]]
      then
        echo -e "\nIt's higher than that, guess again:"
      else
        echo -e "\nIt's lower than that, guess again:"
      fi
    fi
  done

  # echo -e "\nThanks for playing!\n"
}

MAIN_MENU
