#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
  then
    echo -e "Please provide an element as an argument."
  else
    if [[ $1 =~ ^[1-9]+$ ]]
      then
        RESULT=$($PSQL "SELECT  e.atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements AS e INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE e.atomic_number = $1")
      else
        RESULT=$($PSQL "SELECT  e.atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements AS e INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE e.symbol = '$1' OR e.name = '$1'")
    fi
    if [[ ! -z $RESULT ]]
      then
        echo $RESULT | while read  ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR TYPE BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT
          do
            echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
          done
      else
        echo "I could not find that element in the database."
    fi
fi