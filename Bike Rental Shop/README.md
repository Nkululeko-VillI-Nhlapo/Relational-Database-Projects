# 🚲 Bike Rental Shop Documentation 🛠️
## Nhlapo Nkululeko
## bike-shop.sh and PostgreSQL Database 

## Bike Rental Shop Script Overview:


### Introduction:
The Bike Rental Shop script is a Bash script that provides a command-line interface for a bike rental shop. It allows users to perform various actions such as renting a bike, returning a bike, viewing rental history, and truncating the database.

### Main Features:
- Rent a bike 🚲
- Return a bike 🔄
- View rental history 📜
- Truncate database 🗑️

### Script Components:
1. **Main Menu**
2. **Rent Menu**
3. **Return Menu**
4. **View History**
5. **Truncate Tables**

### Additional Functions:
- Logging 📝
- Input Validation ✅

## Script Usage:
- Execute the Bash script to interact with the bike rental shop interface.
- Ensure PostgreSQL is installed and configured before running the script.

## Conclusion:
The Bike Rental Shop script provides a user-friendly interface for managing bike rentals, enhancing the efficiency and organization of the rental process. 🚀

## PostgreSQL Database Overview:

### Database Overview:
The Bike Rental database stores information about bikes, customers, and rentals for a fictional bike rental shop.

### Table Descriptions:
1. **bikes:**
   - 🆔 bike_id: Unique identifier for each bike.
   - 🚴‍♂️ type: Type of bike (e.g., Mountain, Road, BMX).
   - 📏 size: Size of the bike.
   - 🟢 available: Indicates whether the bike is available for rent.

2. **customers:**
   - 🆔 customer_id: Unique identifier for each customer.
   - ☎️ phone: Phone number of the customer (unique constraint).
   - 👤 name: Name of the customer.

3. **rentals:**
   - 🆔 rental_id: Unique identifier for each rental.
   - 🆔 customer_id: Foreign key referencing the customer who rented the bike.
   - 🆔 bike_id: Foreign key referencing the bike that was rented.
   - 📅 date_rented: Date when the bike was rented.
   - 📅 date_returned: Date when the bike was returned (nullable).

### Constraints:
- **bikes:**
  - 🗝️ Primary Key: bike_id
- **customers:**
  - 🗝️ Primary Key: customer_id
  - 🔒 Unique Constraint: phone
- **rentals:**
  - 🗝️ Primary Key: rental_id
  - 🔗 Foreign Key: customer_id (references customers.customer_id)
  - 🔗 Foreign Key: bike_id (references bikes.bike_id)

### Sample Data:
Sample data for the bikes, customers, and rentals tables is provided.

