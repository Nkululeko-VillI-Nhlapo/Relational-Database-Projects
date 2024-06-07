# **Nhlapo Nkululeko**
# **Data Insertion Script**

This script is designed to read data from two CSV files, **`courses.csv`** and **`students.csv`**, and insert that data into a PostgreSQL database named **`students`**. The database has four tables: `majors`, `courses`, `students`, and `majors_courses`.

---

## **Script Explanation**

### **Initial Setup**

**PSQL Command:**
```bash
PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
> This sets up the psql command with necessary options to connect to the students database as user freecodecamp and format the output.

1. Truncate Tables:
echo $($PSQL "TRUNCATE students, majors, courses, majors_courses")
> This command truncates (empties) the students, majors, courses, and majors_courses tables to ensure we start with a clean slate.

2. Processing courses.csv - Read and Process Each Line:
cat courses.csv | while IFS="," read MAJOR COURSE
> This reads each line from courses.csv, splitting it by commas into MAJOR and COURSE.

3. Skip Header:
if [[ $MAJOR != "major" ]]
> This skips the header row in the CSV file.

4. Get or Insert major_id:
MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
> Checks if the major exists in the majors table.
> If not, inserts the new major and retrieves its major_id.

5. Get or Insert course_id:
COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
> Checks if the course exists in the courses table.
> If not, inserts the new course and retrieves its course_id.

6. Insert into majors_courses:
INSERT_MAJORS_COURSES_RESULT=$($PSQL "INSERT INTO majors_courses(major_id, course_id) VALUES($MAJOR_ID, $COURSE_ID)")
> Inserts the relationship between the major and the course into the majors_courses table.

7. Processing students.csv-Read and Process Each Line:
cat students.csv | while IFS="," read FIRST LAST MAJOR GPA
> This reads each line from students.csv, splitting it by commas into FIRST, LAST, MAJOR, and GPA.

8. Skip Header:
if [[ $FIRST != "first_name" ]]
> This skips the header row in the CSV file.

9. Get major_id:
MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
> Checks if the major exists in the majors table. If not found, sets MAJOR_ID to null.

10. Insert Student:
INSERT_STUDENT_RESULT=$($PSQL "INSERT INTO students(first_name, last_name, major_id, gpa) VALUES('$FIRST', '$LAST', $MAJOR_ID, $GPA)")
> Inserts the student into the students table, associating them with the major_id if it exists.

11. PostgreSQL Database Dump
> The database schema and initial data are provided in the SQL dump. This includes the creation of tables, sequences, and the insertion of initial data for courses, majors, majors_courses, and students.

12. How to Use
>> Set Up the Database:
>> Run the provided SQL dump to set up the students database with the required schema and initial data.
>> Run the Script:
>> Ensure courses.csv and students.csv are in the same directory as the script.

13. Make the script executable:
>> chmod +x script.sh
14. Run the script:
>> ./script.sh
Verify the Data:
>> Check the students, majors, courses, and majors_courses tables in the students database to ensure the data has been correctly inserted.