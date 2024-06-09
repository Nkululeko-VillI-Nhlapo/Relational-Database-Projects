#!/bin/bash

# Define the PSQL command with necessary options
PSQL="psql --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

# Function to display available services
display_services() {
  # Query the database for service IDs and names
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  
  # Loop through each service and display its ID and name
  echo "$SERVICES" | while IFS="|" read SERVICE_ID NAME
  do
    echo "$SERVICE_ID) $NAME"
  done
}

# Function to prompt the user for service and customer details
prompt_service() {
  # Display available services
  echo "Please select a service:"
  display_services
  
  # Read the selected service ID from user input
  read SERVICE_ID_SELECTED
  
  # Check if the selected service ID is valid
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_NAME ]]
  then
    echo "Invalid service. Please try again."
    prompt_service
  else
    # Prompt the user for their phone number
    echo "Please enter your phone number:"
    read CUSTOMER_PHONE
    
    # Check if the customer already exists in the database
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER_NAME ]]
    then
      # If the customer is new, prompt for their name and insert into the database
      echo "It looks like you are a new customer. Please enter your name:"
      read CUSTOMER_NAME
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    fi
    
    # Retrieve the customer ID
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    
    # Prompt the user for the desired appointment time
    echo "Please enter the time you would like to book (e.g., 10:30 AM):"
    read SERVICE_TIME
    
    # Insert the appointment into the database
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
    
    # Check if the appointment was successfully booked
    if [[ $INSERT_APPOINTMENT_RESULT == "INSERT 0 1" ]]
    then
      echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
    else
      echo "There was an error booking your appointment. Please try again."
    fi
  fi
}

# Main script execution
prompt_service
