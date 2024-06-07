#!/bin/bash

# Program to tell a person's fortune

echo -e "\n~~ Fortune Teller ~~\n"

# Array of possible responses
RESPONSES=("Yes" "No" "Maybe" "Outlook good" "Don't count on it" "Ask again later")
# Generate a random index for the responses array
N=$(( RANDOM % 6 ))

# Function to prompt the user for a yes or no question
function GET_FORTUNE() {
  if [[ ! $1 ]]
  then
    # Initial prompt if no argument is passed
    echo Ask a yes or no question:
  else
    # Prompt if the question does not end with a question mark
    echo Try again. Make sure it ends with a question mark:
  fi

  # Read user input
  read QUESTION
}

# Initial call to GET_FORTUNE function
GET_FORTUNE

# Loop until the user provides a question ending with a question mark
until [[ $QUESTION =~ \?$ ]]
do
  GET_FORTUNE again
done

# Display the fortune
echo -e "\n${RESPONSES[$N]}"
