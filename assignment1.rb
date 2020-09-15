=begin
Jason Kantner
CSC 415-02
Dr. Pulimood
Assignment 1
=end

require 'csv' #Call requie 'csv' so I am able to read in CSV files

class Methods #Create a class called Methods, which is where all of the methods called in the main menu are stored

  @@main_hash = Hash.new #Created a class hash called main_hash. This is where the CSV data will be stored
  @@group = Hash.new #Created another class Hash called group

  #Method 1: View student data currently stored in the system DONE
  def view_data()
    if @@main_hash.length == 0
      puts("There is currently no data stored in the system.") #If there is no info in the main_hash, an error message is returned
    else
      @@main_hash.each{|v| puts "#{v}"} #If there is info in the main_hash, then it is printed onto the screen
    end
    puts
  end

  #Method 2: Input Student Data
  def input_data()
    loop do #Created a loop that will keep running this method until certain criteria are met.
      file_name = #Declared an empty variable called file_name
      print("Please Enter a File Name: ")
      file_name = gets.chomp #Set file_name equal to the users input

      if(File.exist?(file_name))
        @@main_hash = CSV.read(file_name, headers: true) #If the file exists in the directory the CSV data is stored in the main_hash object
        return ("Data Entered!")
        puts
      else
        puts("Invalid File.") #If the file does not exist in the directory, the method loops until a file is read into the program
        puts
      end
    end
  end

  #Method 3: Modify Student Data
  def modify_data()
    if @@main_hash.length == 0
      puts("There is currently no data stored in the system.") #If there is no info in the main_hash, an error message is returned
    else
      selection_2 =
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

        if selection_2 == "1" #If the user chooses 1, then they add a new line into the main_hash
          new_arr = Array.new #Create a new array called new_arr

          print("Please Enter First Name of New Student (Required): ") #Prompts the user to enter each field for the new entry
          user_add = gets.chomp
          new_arr[0] = user_add #Set the specified index in the new_arr to be equal to the user's input. This is done for each field
          print("Please Enter Last Name of New Student (Required): ")
          user_add = gets.chomp
          new_arr[1] = user_add
          print("Please Enter Email of New Student (Required): ")
          user_add = gets.chomp
          new_arr[2] = user_add
          print("Please Enter Section of New Student (Required): ")
          user_add = gets.chomp
          new_arr[3] = user_add
          print("Please Enter Major of New Student (Required): ")
          user_add = gets.chomp
          new_arr[4] = user_add
          print("Please Enter 2nd Major of New Student (Optional): ")
          user_add = gets.chomp
          new_arr[5] = user_add
          print("Please Enter Minor of New Student (Optional): ")
          user_add = gets.chomp
          new_arr[6] = user_add
          print("Please Enter 2nd Minor of New Student (Optional): ")
          user_add = gets.chomp
          new_arr[7] = user_add

          @@main_hash.push(Array(new_arr)) #Push all of the data stored in new_arr into main_hash
          puts
          puts("Data Entered!")
          puts
        elsif selection_2 == "2" #If the user enters 2 as their selection, then they delete an entry from the main_hash
          @@main_hash.each_with_index {|val, index| puts "#{val} => #{index}" }
          print("Please Enter the Row Number of the Student Entry to Delete: ") #Promts the user to select the index/row of the entry they want to delete
          user_delete = gets.chomp
          @@main_hash.delete(user_delete.to_i) #Delete the line specified by the user from main_hash
          puts("Data Removed!")
          puts
        elsif selection_2 == "3" #If the user picks 3 as their selection, then they edit an exist entry
          @@main_hash.each_with_index {|val, index| puts "#{val} => #{index}"}
          print("Please Enter the Row Number of the Student Entry to Modify: ") # Have the user choose the index/row of the entry they want to edit
          user_edit = gets.chomp
          puts
          print(@@main_hash[user_edit.to_i])
          puts

          print("Please Enter the First Name this Entry (Required): ") #Prompt the user to enter in new data for the specified entry
          user_changes = gets.chomp
          @@main_hash[user_edit.to_i][0] = user_changes
          print("Please Enter the Last Name this Entry (Required): ")
          user_changes = gets.chomp
          @@main_hash[user_edit.to_i][1] = user_changes
          print("Please Enter the Email for this Entry (Required): ")
          user_changes = gets.chomp
          @@main_hash[user_edit.to_i][2] = user_changes
          print("Please Enter the Section for this Entry (Required): ")
          user_changes = gets.chomp
          @@main_hash[user_edit.to_i][3] = user_changes
          print("Please Enter the Major for this Entry (Required): ")
          user_changes = gets.chomp
          @@main_hash[user_edit.to_i][4] = user_changes
          print("Please Enter the 2nd Major for this Entry (Optional): ")
          user_changes = gets.chomp
          @@main_hash[user_edit.to_i][5] = user_changes
          print("Please Enter the Minor for this Entry (Optional): ")
          user_changes = gets.chomp
          @@main_hash[user_edit.to_i][6] = user_changes
          print("Please Enter the 2nd Minor for this Entry (Optional): ")
          user_changes = gets.chomp
          @@main_hash[user_edit.to_i][7] = user_changes

          puts("Entry Modified!")
        elsif selection_2 == "4"
          return("Returning to Main Menu") # If the user picks 4 as their selection, then they are taken back to the main menu
        else
          puts "Error: Please Enter a Valid Selection" #If no specified selection is given, return an error and prompt the user to enter a valid selection
          puts
        end
      end
    end
  end

  #Method 4: Form a Group
  def form_group()
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

        if selection_3 == "1"
          @@group = @@main_hash.group_by{|v| v["section"]}.to_h #Sets the group hash equal to the main_hash divided into groups by section
          puts("Divide by Section")
          puts
        elsif selection_3 == "2"
          @@group = @@main_hash.group_by{|v| v["major1"]}.to_h #Sets the group hash equal to the main_hash divided into groups by major1
          puts("Divide by Major")
          puts
        elsif selection_3 == "3"
          @@group = @@main_hash.group_by{|v| v["first_name"][0]}.to_h #Sets the group hash equal to the main_hash divided into groups by alphabetical order by first_name
          puts("Divided Alphabetically by First Name")
          puts
        elsif selection_3 == "4"
          @@group = @@main_hash.group_by{|v| v["last_name"][0]}.to_h #Sets the group hash equal to the main_hash divided into groups by alphabetical order by last_name
          puts("Divided Alphabetically by Last Name")
          puts
        elsif selection_3 == "5"
          sect = @@main_hash.group_by {|v| v["section"]} #Create a temporary hash called sect that divided the data by section
          @@group = sect.map {|x, y| [x, y.group_by {|v| v["first_name"][0]}]}.to_h #Set group hash equal to sect in alphabetical order
          puts("Divided by Section and Alphabetically")
          puts
        elsif selection_3 == "6"
          sect = @@main_hash.group_by {|v| v["section"]} #Create a temporary hash called sect that divided the data by section
          @@group = sect.map {|x, y| [x, y.group_by {|v| v["major1"]}]}.to_h #Set group hash equal to sect divided by major1
          puts("Divided by Section and by Major")
          puts()
        elsif selection_3 == "7"
          return ("Returning to Main Menu") #If 7 is selected by user, the user is brought back to the main menu
        else
          puts "Error: Please Enter a Valid Selection" #If a valid selection is not entered, the user is given an error
          puts
        end
      end
    end
  end

#Method 5: View a Group
  def view_group()
    if @@group.length == 0
      puts("There is currently no group.") #If there is no data in the group hash, an error is returned
    else
      @@group.each{ |k, v|
        puts("(#{k} => #{v}") #Prints out the data from the group hash. Both the key and value
        if k != @@group.keys.last
           puts("\n") #A new line is given between each section
        end
       }
    end
  end

  #Method 6: Export Group Data to File
  def export_group()
    export_file = #Create a new variable called export_file

    if @@group.length == 0
      #puts
      return ("There is currently no group.") #If no data is stored in group hash, then an eror is returned
    else
      print("Please Enter File Name to Export Data To (.txt File): ")
      export_file = gets.chomp #Prompt the user to enter the name of the file they want to export the group data to
      File.open(export_file, 'w') do |file|
        @@group.each{ |k, v|
          file.write("(#{k} => #{v}") #Write the group data into the file, divided by section, with new lines dividing them
          if k != @@group.keys.last
            file.write(",\n")
            file.write("\n")
          end
        }
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

  if menu_selection== "1" #Create new instances of the Methods class that call the desired function
    puts(Methods.new.view_data)
  elsif menu_selection== "2"
    puts(Methods.new.input_data)
  elsif menu_selection== "3"
    puts(Methods.new.modify_data)
  elsif menu_selection== "4"
    puts(Methods.new.form_group)
  elsif menu_selection== "5"
    Methods.new.view_group
  elsif menu_selection== "6"
    puts(Methods.new.export_group)
  elsif menu_selection== "7"
    puts("Thank You!")
    exit #If the user chooses this option, the program will stop running
  else
    puts "Error: Please Enter a Valid Selection" #If none of the specified values are entered, an error message is printed and the select screen loops again
    puts
  end
end
