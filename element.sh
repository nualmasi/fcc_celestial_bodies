#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
  exit
elif [[ $1 =~ ^[0-9]+$ ]]
then
  # search atomic_number
  ELEMENT_VALUES=$($PSQL "SELECT atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, symbol, name, 
    t.type FROM properties p JOIN elements USING(atomic_number) JOIN types t USING(type_id) WHERE elements.atomic_number = $1 ORDER BY atomic_number LIMIT 1")
  # echo $ELEMENT_VALUES
else
  # search symbol
  ELEMENT_VALUES=$($PSQL "SELECT atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, symbol, name, 
    t.type FROM properties JOIN elements USING(atomic_number) JOIN types t USING(type_id) WHERE elements.symbol = '$1' ORDER BY atomic_number LIMIT 1;")
  # echo $ELEMENT_VALUES
  if [[ -z $ELEMENT_VALUES ]]
  then
    # search symbol
    ELEMENT_VALUES=$($PSQL "SELECT atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, symbol, name, 
    t.type FROM properties JOIN elements USING(atomic_number) JOIN types t USING(type_id) WHERE elements.name = '$1' ORDER BY atomic_number LIMIT 1;")
    # echo $ELEMENT_VALUES
  fi
fi
if [[ -z $ELEMENT_VALUES ]]
then
  echo "I could not find that element in the database."
else
  echo $ELEMENT_VALUES | while IFS=\| read ATOMIC_NUMBER ATOMIC_MASS MPC BPC SY NAME TYPE
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SY). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MPC celsius and a boiling point of $BPC celsius."
  done
fi
