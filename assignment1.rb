=begin
Jason Kantner
CSC 415-02
Dr. Pulimood
Assignment 1
=end

require 'csv' #Call requie 'csv' so I am able to read in CSV files

class Methods #Create a class called Methods, which is where all of the methods called in the main menu are stored

  @@main_hash = Hash[:first_name => "", :last_name => "", :email => "", :section => "", :major1 => "", :major2 => "", :minor1 => "", :minor2 => ""] #Created a class hash called main_hash. This is where the CSV data will be stored
  @@group = Hash.new #Created another class Hash called group

  #Functionality Method 1: This method is used when a new student entry is added into the existing hash data
  def add_entry_val(index)
    user_select = ""
    temp_arr = Array.new #Create a new array called temp_arr
    user_select = gets.chomp #Set user_select equal to what the user enters in the terminal

    case index #Created a cash statement based on the value of index
    when 5, 6, 7
      temp_arr[index] = user_select #Set the specified index in the temp_arr equal to the user's input.
    else
      loop do #Created a loop statement that is ran when the user does not enter a value for a mandatory field
        if user_select.length == 0
          print("Please Enter a Value for This Entry: ") #Returns an error message if a mandatory field is left blank
          user_select = gets.chomp
        else
          return temp_arr[index] = user_select #If not left empty, the value is stored in temp_arr
        end
      end
    end
  end

  #Functionality Method 2: This method is called when a user wants to edit an existing entry in the hash
  def edit_entry(row, index)
    user_changes = ""
    user_changes = gets.chomp

    case index
    when "major2", "minor1", "minor2"
      @@main_hash[row.to_i][index] = user_changes #Enter the user changes into the correct index of the hash
    else
      loop do
        if user_changes.length == 0
          print("Please Enter a Value for This Entry: ")#If a mandatory field is left empty, an error message will be displayed
          user_changes = gets.chomp
        else
          return @@main_hash[row.to_i][index] = user_changes #If the field is not blank, the user edits are stored
        end
      end
    end
  end

  #Funtionality Method 3: This method is used when the user wants to print out the info in main_hash is a formatted way
  def arr_hash (choice)
    if choice == 0
      return @@main_hash.each do |student| #Print the contents of main_hash
        puts "#{student['first_name']}, #{student['last_name']}, #{student['email']}, #{student['section']}, #{student['major1']}, #{student['major2']}, #{student['minor1']}, #{student['minor2']}"
      end
    else
      @@main_hash.each_with_index do |student, index| #Print the contents of main_hash with its index
        puts "#{index} => #{student['first_name']}, #{student['last_name']}, #{student['email']}, #{student['section']}, #{student['major1']}, #{student['major2']}, #{student['minor1']}, #{student['minor2']}"
      end
    end
  end

  #Menu Method 1: View student data currently stored in the system
  def view_data()
    if @@main_hash.length == 0
      puts("There is currently no data stored in the system.") #If there is no info in the main_hash, an error message is returned
    else
      Methods.new.arr_hash(0) #Call the arr_hash method to print out main_hash contents
    end
    puts
  end

  #Menu Method 2: Input Student Data
  def input_data()
    loop do #Created a loop that will keep running this method until certain criteria are met.
      file_name = #Declared an empty variable called file_name
      print("Please Enter a File Name: ")
      file_name = gets.chomp #Set file_name equal to the users input

      if(File.exist?(file_name)) #If statement that runs if the file is present in the directory
        keys = ['first_name', 'last_name', 'email', 'section', 'major1', 'major2', 'minor1', 'minor2'] #Create a variable that stores the key values for main_hash
        @@main_hash = CSV.parse(File.read(file_name)).map {|a| Hash[ keys.zip(a) ] } #Store the values of CSV file into main_hash
        @@main_hash = @@main_hash.delete_if { |h| h["first_name"] == "first_name" } #Delete the first row of the hash table
        return puts("Data Entered!")
      else
        puts("Invalid File.") #If the file does not exist in the directory, the method loops until a file is read into the program
        puts
      end
    end
  end

  #Menu Method 3: Modify Student Data
  def modify_data()
    if @@main_hash.length == 0
      puts("There is currently no data stored in the system.") #If there is no info in the main_hash, an error message is returned
    else
      selection_2 = #Defined variables neccesary for this method
      user_add =
      user_delete =
      user_edit =
      user_changes =

      loop do
        puts("Please Select How You Would Like to Modify the Data: ")
        puts("1. Add Student")
        puts("2. Delete Student")
        puts("3. Edit Student Entry")
        puts("4. Return to Main Menu")
        puts
        print("Enter your Selection: ") #Printed a sub-menu that gives the users options on how they want to modify the stored data
        selection_2 = gets.chomp # Set selection_2 equal to the user's input

        case selection_2
        when "1" #If the user chooses 1, then they add a new line into the main_hash
          new_hash = Hash.new #Create a new hash called new_hash

          print("Please Enter First Name of New Student (Required): ") #Prompts the user to enter each field for the new entry
          new_hash["first_name"] = Methods.new.add_entry_val(0) #Call add_entry_val method to add user data
          print("Please Enter Last Name of New Student (Required): ")
          new_hash["last_name"] = Methods.new.add_entry_val(1)
          print("Please Enter Email of New Student (Required): ")
          new_hash["email"] = Methods.new.add_entry_val(2)
          print("Please Enter Section of New Student (Required): ")
          new_hash["section"] = Methods.new.add_entry_val(3)
          print("Please Enter Major of New Student (Required): ")
          new_hash["major1"] = Methods.new.add_entry_val(4)
          print("Please Enter 2nd Major of New Student (Optional): ")
          new_hash["major2"] = Methods.new.add_entry_val(5)
          print("Please Enter Minor of New Student (Optional): ")
          new_hash["minor1"] = Methods.new.add_entry_val(6)
          print("Please Enter 2nd Minor of New Student (Optional): ")
          new_hash["minor2"] = Methods.new.add_entry_val(7)

          @@main_hash.push(Hash(new_hash)) #Push all of the data stored in new_hash into main_hash
          puts("Data Entered!")
          puts
        when "2" #If the user enters 2 as their selection, then they delete an entry from the main_hash
          Methods.new.arr_hash(1) #Returns hash values with indexes by calling arr_hash
          print("Please Enter the Row Number of the Student Entry to Delete: ") #Promts the user to select the index/row of the entry they want to delete
          user_delete = gets.chomp
          delete_val = @@main_hash[user_delete.to_i]["first_name"]
          @@main_hash.delete_if { |h| h["first_name"] == delete_val } #Delete the line specified by the user from main_hash
          puts("Data Removed!")
          puts
        when "3" #If the user picks 3 as their selection, then they edit an exist entry
          Methods.new.arr_hash(1) #Returns hash values with indexes by calling arr_hash
          print("Please Enter the Row Number of the Student Entry to Modify: ") # Have the user choose the index/row of the entry they want to edit
          user_edit = gets.chomp
          puts
          @@main_hash[user_edit.to_i].each_value {|v| print "#{v}, "} #Prints out the specified row for the user to see
          puts
          puts

          print("Please Enter the First Name this Entry (Required): ") #Prompt the user to enter in new data for the specified entry
          Methods.new.edit_entry(user_edit, "first_name") #Call the edit_entry method to edit specified data
          print("Please Enter the Last Name this Entry (Required): ")
          Methods.new.edit_entry(user_edit, "last_name")
          print("Please Enter the Email for this Entry (Required): ")
          Methods.new.edit_entry(user_edit, "email")
          print("Please Enter the Section for this Entry (Required): ")
          Methods.new.edit_entry(user_edit, "section")
          print("Please Enter the Major for this Entry (Required): ")
          Methods.new.edit_entry(user_edit, "major1")
          print("Please Enter the 2nd Major for this Entry (Optional): ")
          Methods.new.edit_entry(user_edit, "major2")
          print("Please Enter the Minor for this Entry (Optional): ")
          Methods.new.edit_entry(user_edit, "minor1")
          print("Please Enter the 2nd Minor for this Entry (Optional): ")
          Methods.new.edit_entry(user_edit, "minor2")
          puts("Entry Modified!")
          puts
        when "4"
          return("Returning to Main Menu") # If the user picks 4 as their selection, then they are taken back to the main menu
        else
          puts "Error: Please Enter a Valid Selection" #If no specified selection is given, return an error and prompt the user to enter a valid selection
          puts
        end
      end
    end
  end

  #Menu Method 4: Form a Group
  def form_group()
    @@group_choice = ""

    if @@main_hash.length == 0
      puts("There is currently no data stored in the system.") #If there is no info in the main_hash, an error message is returned
    else
      loop do
        puts("Please Select How You Would Like to Divide the Groups: ")
        puts("1. Divide by Section")
        puts("2. Divide by Major")
        puts("3. Divide Alphabetically by First Name")
        puts("4. Divide Alphabetically by Last Name")
        puts("5. Divide by Section and Alphabetically")
        puts("6. Divide by Section and Major")
        puts("7. Return to Main Men")
        puts
        print("Enter your Selection: ") #List a sub-menu for the user to pick a way to group the data from main_hash
        selection_3 = gets.chomp #The user's selection is stored in the selection_3 variable

        case selection_3 #Created a case statement that is based on the users input
        when "1"
          @@group = @@main_hash.group_by { |v| v["section"]} #Set @@group equal to the specfied main_hash grouping
          puts("Divide by Section")
          @@group_choice = ""
          puts
        when "2"
          @@group = @@main_hash.group_by { |v| v["major1"]}
          puts("Divide by Major")
          @@group_choice = ""
          puts
        when "3"
          @@group = @@main_hash.group_by { |v| v["first_name"][0]}
          puts("Divided Alphabetically by First Name")
          @@group_choice = ""
          puts
        when "4"
          @@group = @@main_hash.group_by { |v| v["last_name"][0]}
          puts("Divided Alphabetically by Last Name")
          @@group_choice = ""
          puts
        when "5"
          sect = @@main_hash.group_by { |v| v["section"]} #Create a temporary hash called sect that divided the data by section
          @@group = sect.map {|x, y| [x, y.group_by {|v| v["first_name"][0]}]}.to_h #Set group hash equal to sect divided by first_name
          puts("Divided by Section and Alphabetically")
          @@group_choice = "1"
          puts
        when "6"
          sect = @@main_hash.group_by {|v| v["section"]} #Create a temporary hash called sect that divided the data by section
          @@group = sect.map {|x, y| [x, y.group_by {|v| v["major1"]}]}.to_h #Set group hash equal to sect divided by major1
          puts("Divided by Section and by Major")
          @@group_choice = "1"
          puts()
        when "7"
          return ("Returning to Main Menu") #If 7 is selected by user, the user is brought back to the main menu
        else
          puts "Error: Please Enter a Valid Selection" #If a valid selection is not entered, the user is given an error
          puts
        end
      end
    end
  end

#Menu Method 5: View a Group
  def view_group()
    if @@group.length == 0
      puts("There is currently no group.") #If there is no data in the group hash, an error is returned
    else
      if @@group_choice == "1" #If statement based on the type of group division
        @@group.each{ |k, v|
           i = 0
           puts("#{k} => #{v}") #Print out the key and value for each group
            if k != @@group.keys
               puts("\n") #A new line is given between each section
           end
           }
      else
      @@group.each{ |k, v|
         i = 0
         puts("Group #{k} ^^^ #{while i < v.length do #Used a while loop to only print the values of each hash in a formatted fashion
            print v[i].values
            puts("\n")
            i = i + 1
          end }")
          if k != @@group.keys
             puts("\n") #A new line is given between each section
          end
         }
       end
    end
  end

  #Menu Method 6: Export Group Data to File
  def export_group()
    export_file = #Create a new variable called export_file

    if @@group.length == 0
      return ("There is currently no group.") #If no data is stored in group hash, then an eror is returned
    else
      print("Please Enter File Name to Export Data To (.txt File): ")
      export_file = gets.chomp #Prompt the user to enter the name of the file they want to export the group data to
      File.open(export_file, 'w') do |file|
        if @@group_choice == "1" #If statement based on the type of group division
          @@group.each{ |k, v|
            file.write("#{k} => #{v}") #Write the group data into the file, divided by section, with new lines dividing them
            if k != @@group.keys.last
              file.write(",\n")
              file.write("\n")
            end
          }
        else
          @@group.each{ |k, v|
            i = 0
            file.write("Group #{k} ^^^ #{while i < v.length do #Used a while loop to write formatted groups to a CSV file
               file.write v[i].values
               file.write("\n")
               i = i + 1
             end }")
            if k != @@group.keys.last
              file.write(",\n")
              file.write("\n")
            end
          }
        end
      puts("File " + export_file + " Created!")
      end
    end
  end
end

#THIS SECTION OF CODE GENERATES THE MAIN MENU AND CALLS OBJECTS FROM THE METHODS CLASS
menu_selection = #Created a new variable called menu_selection which will store the user's method selection value

puts
puts ("Welcome to the Ruby Student Database!") #Print out a welcome message onto the screen
puts

loop do #Created a loop that will continue to run the program until the user quits.
  puts ("Please Enter a Number to Select an Option from the List Below:") #Created a menu with options for the user to choose from
  puts("1. View Student Data")
  puts("2. Input Student Data")
  puts("3. Modify Student Data")
  puts("4. Form a Group")
  puts("5. View Current Group")
  puts("6. Export Group Data to File")
  puts("7. Exit Program")
  puts
  print("Enter your Selection: ")
  menu_selection= gets.chomp #Set menu_selection equal to the value the user enters
  puts

  case menu_selection
  when "1" #Create new instances of the Methods class that call the desired function
    puts(Methods.new.view_data)
  when "2"
    puts(Methods.new.input_data)
  when "3"
    puts(Methods.new.modify_data)
  when "4"
    puts(Methods.new.form_group)
  when "5"
    Methods.new.view_group
  when "6"
    puts(Methods.new.export_group)
  when "7"
    puts("Thank You!")
    exit #If the user chooses this option, the program will stop running
  else
    puts "Error: Please Enter a Valid Selection" #If none of the specified values are entered, an error message is printed and the select screen loops again
    puts
  end
end
