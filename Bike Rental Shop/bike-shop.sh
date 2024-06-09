#!/bin/bash

# Define the PostgreSQL command with appropriate parameters
PSQL="psql -X --username=freecodecamp --dbname=bikes --tuples-only -c"

# Function to log activities for auditing purposes
LOG_ACTIVITY() {
  echo "$(date): $1" >> activity.log
}

# Function to validate the phone number format (10 digits)
VALIDATE_PHONE_NUMBER() {
  if [[ ! $1 =~ ^[0-9]{10}$ ]]; then
    echo "Invalid phone number format. Please enter a 10-digit phone number."
    return 1
  fi
  return 0
}

# Function to truncate all tables in the database
TRUNCATE_TABLES() {
  echo -e "\nWARNING: This will delete all data in the database!"
  echo "Are you sure you want to continue? (yes/no)"
  read CONFIRMATION

  if [[ $CONFIRMATION == "yes" ]]; then
    $PSQL "TRUNCATE TABLE rentals, bikes, customers RESTART IDENTITY CASCADE"
    LOG_ACTIVITY "Database truncated"
    echo "All data has been erased."
  else
    echo "Truncate operation aborted."
  fi
}

# Display the initial banner for the bike rental shop
echo -e "\n~~~~~ Bike Rental Shop ~~~~~\n"

# Prompt to truncate the database
TRUNCATE_TABLES

# Main menu function
MAIN_MENU() {
  if [[ $1 ]]; then
    echo -e "\n$1"
  fi

  echo "How may I help you?" 
  echo -e "\n1. Rent a bike\n2. Return a bike\n3. View rental history\n4. Exit"
  read MAIN_MENU_SELECTION

  case $MAIN_MENU_SELECTION in
    1) RENT_MENU ;;
    2) RETURN_MENU ;;
    3) VIEW_HISTORY ;;  # Added option to view rental history
    4) EXIT ;;
    *) MAIN_MENU "Please enter a valid option." ;;
  esac
}

# Rent menu function
RENT_MENU() {
  # Get available bikes
  AVAILABLE_BIKES=$($PSQL "SELECT bike_id, type, size FROM bikes WHERE available = true ORDER BY bike_id")

  if [[ -z $AVAILABLE_BIKES ]]; then
    MAIN_MENU "Sorry, we don't have any bikes available right now."
  else
    echo -e "\nHere are the bikes we have available:"
    echo "Bike ID | Type | Size"
    echo "$AVAILABLE_BIKES" | while read BIKE_ID BAR TYPE BAR SIZE; do
      echo "$BIKE_ID) $SIZE\" $TYPE Bike"
    done

    echo -e "\nWhich one would you like to rent?"
    read BIKE_ID_TO_RENT

    if [[ ! $BIKE_ID_TO_RENT =~ ^[0-9]+$ ]]; then
      MAIN_MENU "That is not a valid bike number."
    else
      # Check if the bike is available
      BIKE_AVAILABILITY=$($PSQL "SELECT available FROM bikes WHERE bike_id = $BIKE_ID_TO_RENT AND available = true")

      if [[ -z $BIKE_AVAILABILITY ]]; then
        MAIN_MENU "That bike is not available."
      else
        echo -e "\nWhat's your phone number?"
        read PHONE_NUMBER

        # Validate phone number
        VALIDATE_PHONE_NUMBER $PHONE_NUMBER
        if [[ $? -ne 0 ]]; then
          MAIN_MENU "Please enter a valid phone number."
        else
          CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$PHONE_NUMBER'")

          if [[ -z $CUSTOMER_NAME ]]; then
            echo -e "\nWhat's your name?"
            read CUSTOMER_NAME
            INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$PHONE_NUMBER')")
          fi

          CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$PHONE_NUMBER'")
          INSERT_RENTAL_RESULT=$($PSQL "INSERT INTO rentals(customer_id, bike_id) VALUES($CUSTOMER_ID, $BIKE_ID_TO_RENT)")
          SET_TO_FALSE_RESULT=$($PSQL "UPDATE bikes SET available = false WHERE bike_id = $BIKE_ID_TO_RENT")

          BIKE_INFO=$($PSQL "SELECT size, type FROM bikes WHERE bike_id = $BIKE_ID_TO_RENT")
          BIKE_INFO_FORMATTED=$(echo $BIKE_INFO | sed 's/ |/"/')

          # Log the rental activity
          LOG_ACTIVITY "Customer $CUSTOMER_NAME rented bike $BIKE_ID_TO_RENT"
          MAIN_MENU "I have put you down for the $BIKE_INFO_FORMATTED Bike, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
        fi
      fi
    fi
  fi
}

# Return menu function
RETURN_MENU() {
  echo -e "\nWhat's your phone number?"
  read PHONE_NUMBER

  # Validate phone number
  VALIDATE_PHONE_NUMBER $PHONE_NUMBER
  if [[ $? -ne 0 ]]; then
    MAIN_MENU "Please enter a valid phone number."
  else
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$PHONE_NUMBER'")

    if [[ -z $CUSTOMER_ID ]]; then
      MAIN_MENU "I could not find a record for that phone number."
    else
      CUSTOMER_RENTALS=$($PSQL "SELECT bike_id, type, size FROM bikes INNER JOIN rentals USING(bike_id) INNER JOIN customers USING(customer_id) WHERE phone = '$PHONE_NUMBER' AND date_returned IS NULL ORDER BY bike_id")

      if [[ -z $CUSTOMER_RENTALS ]]; then
        MAIN_MENU "You do not have any bikes rented."
      else
        echo -e "\nHere are your rentals:"
        echo "Bike ID | Type | Size"
        echo "$CUSTOMER_RENTALS" | while read BIKE_ID BAR TYPE BAR SIZE; do
          echo "$BIKE_ID) $SIZE\" $TYPE Bike"
        done

        echo -e "\nWhich one would you like to return?"
        read BIKE_ID_TO_RETURN

        if [[ ! $BIKE_ID_TO_RETURN =~ ^[0-9]+$ ]]; then
          MAIN_MENU "That is not a valid bike number."
        else
          RENTAL_ID=$($PSQL "SELECT rental_id FROM rentals INNER JOIN customers USING(customer_id) WHERE phone = '$PHONE_NUMBER' AND bike_id = $BIKE_ID_TO_RETURN AND date_returned IS NULL")

          if [[ -z $RENTAL_ID ]]; then
            MAIN_MENU "You do not have that bike rented."
          else
            RETURN_BIKE_RESULT=$($PSQL "UPDATE rentals SET date_returned = NOW() WHERE rental_id = $RENTAL_ID")
            SET_TO_TRUE_RESULT=$($PSQL "UPDATE bikes SET available = true WHERE bike_id = $BIKE_ID_TO_RETURN")

            # Log the return activity
            LOG_ACTIVITY "Customer returned bike $BIKE_ID_TO_RETURN"
            MAIN_MENU "Thank you for returning your bike."
          fi
        fi
      fi
    fi
  fi
}

# View rental history function
VIEW_HISTORY() {
  echo -e "\nWhat's your phone number?"
  read PHONE_NUMBER

  # Validate phone number
  VALIDATE_PHONE_NUMBER $PHONE_NUMBER
  if [[ $? -ne 0 ]]; then
    MAIN_MENU "Please enter a valid phone number."
  else
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$PHONE_NUMBER'")

    if [[ -z $CUSTOMER_ID ]]; then
      MAIN_MENU "I could not find a record for that phone number."
    else
      CUSTOMER_HISTORY=$($PSQL "SELECT bike_id, type, size, date_rented, date_returned FROM bikes INNER JOIN rentals USING(bike_id) INNER JOIN customers USING(customer_id) WHERE phone = '$PHONE_NUMBER' ORDER BY date_rented")

      if [[ -z $CUSTOMER_HISTORY ]]; then
        MAIN_MENU "You do not have any rental history."
      else
        echo -e "\nHere is your rental history:"
        echo "Bike ID | Type | Size | Date Rented | Date Returned"
        echo "$CUSTOMER_HISTORY" | while read BIKE_ID BAR TYPE BAR SIZE BAR DATE_RENTED BAR DATE_RETURNED; do
          echo "$BIKE_ID | $SIZE\" $TYPE | $DATE_RENTED | $DATE_RETURNED"
        done
        MAIN_MENU
      fi
    fi
  fi
}

# Exit function to thank the user
EXIT() {
  echo -e "\nThank you for stopping in.\n"
}

# Start the script by showing the main menu
MAIN_MENU
