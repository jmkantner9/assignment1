#Jason Kantner
#CSC 415-02
#Dr. Pulimood
#Assignment 1


VM NAME: student1@csc415-server27.hpc.tcnj.edu
VM PASSWORD: CrimMajor2021!
VM FILE PATH: vm-csc415/assignment1/
GITHUB REPOSITORY URL: https://github.com/jmkantner9/assignment1.git


INSTRUCTIONS FOR RUNNING THE PROGRAM
1. Login to my student1 VM (information listed in section above)
2. Once in, navigate to the file path vm-csc415/assignment1/
      -This directory is the GitHub Repository Clone for this project
3. To run the program, type in the terminal, >ruby assignment1.rb
4. Once the program is running, you will be greeted by a welcome screen that lists
  out the options for what to do in the program.
      -First, you should start with inserting data from one of the CSV files within the Repository
5. To enter a CSV file, enter >2 to select the proper option
6. When prompted, enter in the name of the CSV file. Be sure to include the .csv at the end of the file name
      -Ex. > input1.csv
7. Once data is entered into the program, many of the other options are available
8. On the main menu page, type >1 to view the current data stored in the system
9. To modify this data in various ways, type >3. Once in the sub-menu, you will be greeted with 4 options
      - Type >1 to add student data: This will prompt the user to enter in data for each field. Once completed
        the new student information will be appended onto the existing hash
      - Type >2 to delete a student record. You will be given the list of records and will be asked to select
        the index/row of the student entry you want to delete
      -Type >3 to modify existing student data. You will be asked to choose the index/row of the entry you want
       to modify, and then you will enter all of the updated information into the terminal
      -Type >4 to return to the main menu
10. Type >4 in the main menu to be given the sub-menu to divide the student data into groups based on a list of choices which include:
      - Type >1 to divide the data by section
      - Type >2 to divide the data by major
      - Type >3 to divide the data alphabetically by student first name
      - Type >4 to divide the data alphabetically by student last name
      - Type >5 to divide the data by both section and alphabetically by first name
      - Type >6 to divide the data by both section and major
      - Type >7 to return to the main menu
11. Type >5 in the main menu to view the current group data stored in the system
      -Note: main student data and the grouped data are stored in 2 different objects, so they can both be viewed
      by their menu selection
12. Type >6 in the main menu to export the group data to a file
      -Once this option is selected, you must enter a name for the file in .txt format. Once a name is provided, the file is created and
      stored in the repository
13. In the main menu, type >7 to exit the program

RESUBMISSION CHANGES
1. Replaced If..elsif statements with case statements
  -Lines: 21-33, 41-53, 119-183, 208-247, 339-358
2. Eliminated long blocks of similar, repetitive code by utilizing 3 new methods
  -Method Names: add_entry_val, edit_entry, arr_hash
3. Mandatory data fields now are required and will print message to user if the field is left blank
  -Accomplished within the add_entry_val and edit_entry methods
4. Store CSV data in an array of hashes, rather than a CSV::Table
  -Lines: 12, 87-89
5. Reformatted print-outs of groups to be more visually appealing
  -Did this for all groupings except for those group by two values
  -Lines: 265-275, 299-310

KNOWN BUGS, ISSUES OR LIMITATIONS
1. Can only read in and store one external CSV file at a time
      -If a CSV file is already being stored and the user enters another, the original file is replaced by the new one.
2. When deleting/editing the data of an existing row, the user must pick the index of the row they want to edit
      -With big files this can be problematic because the user would have to search through the big table of data
3. When editing a student entry, all information about the student must be re-entered
      -Although it works and allows the user to edit multiple fields at once, it is not intuitive if the
      user only wants to edit one field
4. Dividing the data into groups does not divide the data evenly or based on a specified number of students
      -Dividing the data only puts it into the category specified. This means that the user has no option to choose
      how many students they want per group. This also means that groups of one student will exist.
5. When an option is chosen within a sub-menu, most require an entry for the program to keep going. These menus include:
      -Entering a CSV file
      -Adding, deleting, modifying student data
      -Exporting data to file
