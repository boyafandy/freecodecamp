#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  if [[ $1 ]] 
  then 
    echo -e "\n$1\n"
  else
    echo -e "Welcome to My Salon, how can I help you?\n"
  fi


  SERVICES=$($PSQL "SELECT * FROM services ORDER BY service_id")
  if [[ -z $SERVICES ]]
  then
    echo -e "\n No Services"
  fi

  echo "$SERVICES"| while read SERVICE_ID BAR NAME 
  do
    echo -e "$SERVICE_ID) $NAME"
  done

  read SERVICE_ID_SELECTED
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    GET_SERVICE $SERVICE_ID_SELECTED
  fi
  
}

GET_SERVICE () {
  SERVICE_NAME="$($PSQL "SELECT name FROM services WHERE service_id = $1")"
  if [[ -z $SERVICE_NAME ]] 
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  else 
    echo -e "\n What's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    if [[ -z $CUSTOMER_ID ]]
    then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      INSERT_COSTUMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE') RETURNING customer_id")
      CUSTOMER_ID=$(echo $INSERT_COSTUMER_RESULT | sed -E 's/ .*//g')
    fi
    MAKE_APPOINTMENTS $SERVICE_NAME $CUSTOMER_ID $1
  fi
} 

EXIT() {
  echo -e "\nThank you for your appointment.\n"
}

MAKE_APPOINTMENTS(){
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = $2")
  FORMATTED_NAME=$(echo $CUSTOMER_NAME |  sed -r 's/^ *| *$//g')
  echo -e "\nWhat time would you like your cut, $FORMATTED_NAME?"
  read SERVICE_TIME

  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($2, $3, '$SERVICE_TIME')")
  if [[ $INSERT_APPOINTMENT_RESULT = "INSERT 0 1" ]]
  then
    echo -e "\nI have put you down for a $1 at $SERVICE_TIME, $FORMATTED_NAME."
  fi

  EXIT
}

MAIN_MENU 