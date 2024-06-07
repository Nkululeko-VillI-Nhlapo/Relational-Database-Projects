# World Cup Database Documentation
>>BY NHLAPO NKULULEKO

## 1. Introduction:
   The World Cup Database is a PostgreSQL database that stores information about FIFA World Cup matches, including details like the year, round, participating teams, and match results.

## 2. Table Structures:

   a. **games**:
      - `game_id`: Unique identifier for each game.
      - `year`: The year in which the match took place.
      - `round`: The stage of the tournament (e.g., Final, Semi-Final, Quarter-Final, Eighth-Final).
      - `winner_id`: Foreign key referencing the winning team's ID.
      - `opponent_id`: Foreign key referencing the opposing team's ID.
      - `winner_goals`: Number of goals scored by the winning team.
      - `opponent_goals`: Number of goals scored by the opposing team.

   b. **teams**:
      - `team_id`: Unique identifier for each team.
      - `name`: The name of the team participating in the tournament.

## 3. Data Population:

   a. **Insertion Script**:
      - The provided bash script named `insert_data.sh` reads data from a CSV file named `games.csv`.
      - It inserts teams into the `teams` table if they don't already exist.
      - Then, it inserts match data into the `games` table, referencing the respective teams' IDs.
      - Data from the CSV includes match details such as the year, round, winning team, opposing team, and goal counts.

## 4. Data Queries:

   a. **Query Script**:
      - The bash script named `query_data.sh` executes SQL queries to retrieve specific information from the database.
      - Various queries are performed, including:
        - Total number of goals in all games.
        - Average number of goals per game.
        - Most goals scored in a single game by one team.
        - Number of games where the winning team scored more than two goals.
        - Winner of the 2018 tournament.
        - List of teams that played in specific rounds.
        - List of unique winning team names.
        - Year and team name of all the champions.
        - List of teams starting with 'Co'.

## 5. Bash Scripts:

   a. **Insertion Script** (`insert_data.sh`):
      - This script reads data from the CSV file and inserts it into the database using SQL INSERT statements.
      - It handles the insertion of both teams and match data.

   b. **Query Script** (`query_data.sh`):
      - This script executes predefined SQL queries to retrieve specific information from the database.
      - It provides functionalities to perform analyses and gather insights from the stored data.

## 6. Script Usage:

   - To populate the database, run the `insert_data.sh` script.
   - To perform queries and retrieve information, execute the `query_data.sh` script.

## 7. Conclusion:

   The World Cup Database facilitates the storage and retrieval of FIFA World Cup match data, enabling users to analyze match statistics, team performances, and tournament outcomes.
