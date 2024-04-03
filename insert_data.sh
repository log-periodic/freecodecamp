#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE TABLE games, teams RESTART IDENTITY")

tail -n +2 games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do 
  
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  if [[ -z $WINNER_ID ]]
  then
    INSERT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES ('$WINNER')")
    if [[ $INSERT_TEAM == "INSERT 0 1" ]]
    then
      echo Inserted into teams, $WINNER
    fi    
  fi

  
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
  if [[ -z $OPPONENT_ID ]]
  then
    INSERT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES ('$OPPONENT')")
    if [[ $INSERT_TEAM == "INSERT 0 1" ]]
    then
      echo Inserted into teams, $OPPONENT
    fi    
  fi


  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
  INSERT_GAMES=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
  if [[ INSERT_GAMES == "INSERT 0 1" ]]
  then
    echo Inserted a game
  fi
done