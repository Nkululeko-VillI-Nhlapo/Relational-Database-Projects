#!/bin/bash

# Simple script to ask user three questions

echo -e "\n~~ Questionnaire ~~\n"

# Define the questions
QUESTION1="What's your name?"
QUESTION2="Where are you from?"
QUESTION3="What's your favorite coding website?"

# Ask the first question
echo $QUESTION1
read NAME

# Ask the second question
echo $QUESTION2
read LOCATION

# Ask the third question
echo $QUESTION3
read WEBSITE

# Output a summary of the answers
echo -e "\nHello $NAME from $LOCATION. I learned that your favorite coding website is $WEBSITE!"
