# 🧪 Periodic Table Database Management and Query Script 📊
## Nhlapo Nkululeko

## Introduction 🌟
Welcome to the Periodic Table Database Management and Query Script project! This project involves managing a periodic table database and creating a script to query information about chemical elements from the database. Let's dive in! 💻

## Part 1: Fixing the Database 🛠️
### Column Renaming 🔄
Columns in the database are renamed to adhere to standardized naming conventions. Specifically, the 'weight' column is renamed to 'atomic_mass', and the 'melting_point' and 'boiling_point' columns are renamed to 'melting_point_celsius' and 'boiling_point_celsius', respectively.

### Constraint and Key Addition 🛡️
Various constraints are added to ensure data integrity. This includes adding UNIQUE constraints to the 'symbol' and 'name' columns, setting NOT NULL constraints on certain columns, and creating foreign key constraints.

### Types Table Creation 📊
A new table, 'types', is created to store different types of elements. This table is populated with three types: 'metal', 'nonmetal', and 'metalloid'.

### Data Modification 🔄
Existing data in the database is modified to meet the new schema requirements. This includes capitalizing element symbols, adjusting atomic masses, and adding new elements (Fluorine and Neon).

## Part 2: Creating the Git Repository 🚀
### Repository Initialization 🌱
A Git repository is initialized to version control the project.

### Commit History 📝
Commits are made at each significant step of the project, with clear and descriptive commit messages. This ensures a well-documented history of changes and facilitates collaboration.

## Part 3: Developing the Query Script 📝
### Script Creation 🖥️
A Bash script, 'element.sh', is developed to accept an argument representing an atomic number, symbol, or name of an element and output relevant information about the element from the database.

### Database Querying 📊
The script connects to the database using PostgreSQL and executes SQL queries to retrieve information based on the provided argument.

### Error Handling ❌
The script handles cases where the provided element does not exist in the database, providing appropriate error messages.

### Documentation 📃
The script includes comments and documentation to explain its functionality and usage.

## Running the Project 🚀
1. **Setting Up the Database:**
   - Ensure PostgreSQL is installed on your system.
   - Connect to PostgreSQL using the provided credentials:
     ```
     psql --username=freecodecamp --dbname=periodic_table
     ```
   - Execute the SQL commands provided in the project instructions to fix the database schema and populate it with necessary data.

2. **Cloning the Git Repository:**
   - Clone the Git repository to your local machine:
     ```
     git clone https://github.com/Nkululeko-VillI-Nhlapo/repo.git
     ```

3. **Running the Query Script:**
   - Navigate to the cloned repository directory:
     ```
     cd repo
     ```
   - Ensure the script file ('element.sh') has executable permissions:
     ```
     chmod +x element.sh
     ```
   - Execute the script with an argument representing an atomic number, symbol, or name of an element:
     ```
     ./element.sh
     ```

## Conclusion 🎉
This project showcases the process of fixing a database schema, creating a Git repository for version control, and developing a script to interact with the database. By following these steps, the project ensures data consistency, facilitates collaboration, and provides a convenient way to query information about chemical elements. Happy querying! 🚀🧪

