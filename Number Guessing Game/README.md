# Number Guessing Game 🎲
## Nhlapo Nkululeko

Welcome to the Number Guessing Game! This README.md provides an overview of a simple yet engaging script that allows users to play a number guessing game while interacting with a PostgreSQL database. 🚀

## Overview 📝

The Number Guessing Game script is designed to entertain users by challenging them to guess a secret number within a specified range. Let's dive into the key functionalities of the script:

### Player Authentication 🕵️‍♂️

Upon execution, the script prompts the player to enter their username. It checks whether the player exists in the database. If not, it adds them to the player database.

### Game Play 🎮

The script generates a random secret number between 1 and 1000 for the player to guess. It continuously prompts the player to guess the secret number and provides hints if the guess is too high or too low. The game tracks the number of guesses made by the player until they guess the correct number.

### Statistics 📊

After each game, the script displays statistics to the player, including the number of games played and the best game (fewest guesses).

## Database Setup 💾

The script relies on a PostgreSQL database named 'number_guess' to manage player information and game history. Here's a closer look at the database structure:

### Tables 📑

- **Players Table ('players'):** Stores player information, including a unique 'user_id' and the player's 'username'.
- **Games Table ('games'):** Records game history, tracking details such as the 'game_id', 'user_id', 'number_of_guesses', and the 'secret_number'.

### Relationships 💑

The 'games' table establishes a relationship with the 'players' table via a foreign key 'user_id', linking each game record to a specific player.

## Script Execution 🚀

To enjoy the Number Guessing Game:
- Ensure that PostgreSQL is installed and running on your system.
- Execute the script in a Bash environment.
- Follow the on-screen prompts to play the game and interact with the database.

## Conclusion 🎉

The Number Guessing Game script offers an enjoyable experience for users while also demonstrating fundamental concepts of database management.
Feel free to explore the script, experiment with different features, and enhance its functionality to suit your preferences. Have fun guessing those numbers and exploring the world of databases! 🌟
