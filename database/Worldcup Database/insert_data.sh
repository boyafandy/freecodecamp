#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

#TRUNCATE TABLE
echo $($PSQL "TRUNCATE teams, games")

echo -e "\nINSERT TO DATABASE\n"
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS 
do
  if [[ $YEAR != "year" ]]
  then

    #check winner name in teams table
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    if [[ -z $WINNER_ID ]]
    then
      $($PSQL "INSERT INTO teams(name) VALUES ('$WINNER')")
    fi

    #check opponent name in teams table
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    if [[ -z $OPPONENT_ID ]]
    then
      $($PSQL "INSERT INTO teams(name) VALUES ('$OPPONENT')")
    fi
  fi

  if [[ $YEAR != "year" ]]
  then
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    $($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', '$WINNER_ID', '$OPPONENT_ID', $W_GOALS, $O_GOALS)")
  fi
done

echo INSERT COMPLETED.
