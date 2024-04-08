#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU () {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "\nHere is the list of our services:"
  echo -e "\n1) cut\n2) shave\n3) style"
  echo -e "\nHow may I help you?"
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    1) APPOINTMENT ;;
    2) APPOINTMENT ;;
    3) APPOINTMENT ;;
    *) MAIN_MENU "Please enter a valid option" ;;
  esac
}


APPOINTMENT () {
  # ask a phone number
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # check is customer exists
  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "\nWhat's your name?"
    read CUSTOMER_NAME
    # add customer to the database
    ADD_CUSTOMER=$($PSQL "INSERT INTO customers (name, phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
  fi

  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # ask for time 
  echo -e "\nWhat's your preffered apoointment time?"
  read SERVICE_TIME

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  ADD_APPOINTMENT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED,'$SERVICE_TIME' )")
  SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  echo -e "I have put you down for a $SERVICE at $SERVICE_TIME,$CUSTOMER_NAME."

}




MAIN_MENU