#!/bin/bash

# Program that counts down to zero from a given argument

echo -e "\n~~ Countdown Timer ~~\n"

# Check if the first argument is a positive integer
if [[ $1 -gt 0 ]]
then
  : '
  # This is an alternative way to do the countdown using a for loop
  for (( i = $1; i >= 0; i-- ))
  do
    echo $i
    sleep 1
  done
  '

  # Initialize the countdown variable
  I=$1

  # While loop for the countdown
  while [[ $I -ge 0 ]]
  do
    echo $I
    (( I-- ))
    sleep 1
  done
else
  # Prompt user to include a positive integer
  echo Include a positive integer as the first argument.
fi
