# Salon Management System Documentation 🌟

## Script Explanation:
### Script Overview:
The Bash script serves as a management system for a salon, facilitating the booking of appointments by interacting with a PostgreSQL database. It prompts users to select services, enter their information, and schedules appointments accordingly.

### PSQL Command Setup:
The script begins by defining a variable PSQL that holds the command for connecting to the PostgreSQL database. This command includes options such as the username (--username), database name (--dbname), and other parameters necessary for executing queries.

### Displaying Available Services:
The display_services() function queries the database to retrieve available services. It fetches the service IDs and names from the services table, orders them by service ID, and displays them to the user. Each service is listed with its ID and name.

### Prompting for Service and Customer Details:
The prompt_service() function guides the user through the process of booking an appointment:

- It prompts the user to select a service from the displayed list.
- After selecting a service, the user is asked to input their phone number.
- The script checks if the provided service ID is valid and retrieves the corresponding service name from the database.
- If the service ID is valid, the script checks if the provided phone number belongs to an existing customer.
- If the customer is new (i.e., their phone number is not found in the database), the script prompts the user to enter their name and inserts their information into the customers table.
- The script retrieves the customer ID associated with the provided phone number.
- The user is then prompted to enter the desired appointment time.
- Finally, the script inserts the appointment details (customer ID, service ID, and appointment time) into the appointments table.

### Database Dump:
The provided database dump contains SQL commands to create and populate the database schema for the salon management system:

- It creates tables for appointments, customers, and services.
- Each table includes relevant columns for storing appointment details, customer information, and service offerings.
- Sequences are set up to generate unique IDs for primary keys.
- Constraints such as primary keys, foreign keys, and unique constraints are added to maintain data integrity.
- Initial data for the services table is inserted, providing a starting set of service offerings for the salon.

### Database Structure Explanation:
#### Tables:
- **Appointments (appointments):** Stores information about appointments, including the appointment ID, customer ID, service ID, and appointment time.
- **Customers (customers):** Contains details of customers, including their unique customer ID, name, and phone number.
- **Services (services):** Holds information about the services offered by the salon, including the service ID and name.

#### Sequences:
Sequences (appointments_appointment_id_seq, customers_customer_id_seq, services_service_id_seq) are set up to generate unique IDs for the primary keys of the respective tables.

#### Constraints:
Primary keys, foreign keys, and unique constraints are added to ensure data integrity within the database. These constraints enforce rules such as unique customer phone numbers, valid foreign keys referencing primary keys, and unique service IDs.

### Summary:
The Bash script facilitates the booking of appointments for a salon by interacting with a PostgreSQL database. Users can select services, provide their information, and schedule appointments seamlessly through the script's prompts and interactions with the database. The provided database dump establishes the necessary schema and constraints for the salon management system, ensuring the integrity and reliability of the stored data.
