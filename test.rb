=begin
Jason Kantner
CSC 415-02
Dr. Pulimood
Assignment 1
=end

require 'csv'
#require 'smarter_csv'
#require 'enumerator'

#class Student
#  Struct.new(:first_name, :last_name, :email, :section, :major1, :major2, :minor1, :minor2)
#end

class Methods #Create a class called Methods, which is where all of the methods called in the main menu are stored

  #keys = ["first_name", "last_name", "email", "section", "major1", "major2", "minor1", "minor2"]
#  @@main_hash = { #Declared a new class Hash called main_hash
#      @first_name => "", #Passed in 8 values to act as keys within the hash
#      @last_name => "",
#      @email => "",
#      @section => "",
#      @major1 => "",
#      @major2 => "",
#      @minor1 => "",
#      @minor2 => "",
#  }

  @@main_hash = Array.new
  @@group1 = Hash.new #Created a new class Hash called group1

  #def initialize(first_name, last_name, email, section, major1, major2, minor1, minor2)
  #    @first_name = first_name
  #    @last_name = last_name
  #    @email = email
  #    @section = section
  #    @major1 = major1
  #    @major2 = major2
  #    @minor1 = minor1
  #    @minor2 = minor2
  #end

  #Method 1: View student data currently stored in the system DONE
  def view_data()
    if @@main_hash.length == 0
      print("There is currently no data stored in the system.") #If there is no info in the main_hash, an error message is returned
    else
    @@main_hash.each{|v| puts "#{v}"}
     #@@main_hash.each_with_index {|val, index| puts "#{val} => #{index}" } #If there is info in the main_hash, then it is printed onto the screen
    end
    puts
  end

  #Method 2: Input Student Data
  def input_data()

    loop do
      file_name =
      print("Please Enter a File Name: ")
      file_name = gets.chomp

      if(File.exist?(file_name))
      #  @@main_hash = SmarterCSV.process(file_name)
      #  array = Array.new
        f = File.open(file_name, "r")
        while (line = f.gets)
          arr = line.split(',')
      #    @@main_hash.push({
      #        first_name: arr[0],
      #        last_name: arr[1],
      #        email: arr[2],
      #        section: arr[3],
      #        major1: arr[4],
      #        major2: arr[5],
      #        minor1: arr[6],
      #        minor2: arr[7],
      #    })
        end
        f.close


        #@@main_hash = CSV.read(file_name, headers: true) #File.read()

        puts("Data Entered!")
        return
      else
        puts("Invalid File.")
        puts
      end
    end
  end

  #Method 3: Modify Student Data
  def modify_data()
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
      print("Enter your Selection: ")
      selection_2 = gets.chomp

      if selection_2 == "1"
        new_hash = Array.new

        print("Please Enter First Name of New Student: ")
        user_add = gets.chomp
        new_hash[0] = user_add
        print("Please Enter Last Name of New Student: ")
        user_add = gets.chomp
        new_hash[1] = user_add
        print("Please Enter Email of New Student: ")
        user_add = gets.chomp
        new_hash[2] = user_add
        print("Please Enter Section of New Student: ")
        user_add = gets.chomp
        new_hash[3] = user_add
        print("Please Enter Major of New Student: ")
        user_add = gets.chomp
        new_hash[4] = user_add
        print("Please Enter 2nd Major of New Student (Optional): ")
        user_add = gets.chomp
        new_hash[5] = user_add
        print("Please Enter Minor of New Student (Optional): ")
        user_add = gets.chomp
        new_hash[6] = user_add
        print("Please Enter 2nd Minor of New Student (Optional): ")
        user_add = gets.chomp
        new_hash[7] = user_add

        @@main_hash.push(Array(new_hash))
        puts
        puts("Data Entered!")
        puts
      elsif selection_2 == "2"
        @@main_hash.each_with_index {|val, index| puts "#{val} => #{index}" }
        print("Please Enter the Row Number of the Student Entry to Delete: ")
        user_delete = gets.chomp
        @@main_hash.delete(user_delete.to_i)
        puts("Data Removed!")
        puts
      elsif selection_2 == "3"
        @@main_hash.each_with_index {|val, index| puts "#{val} => #{index}"}
        print("Please Enter the Row Number of the Student Entry to Modify: ")
        user_edit = gets.chomp
        puts
        print(@@main_hash[user_edit.to_i])
        puts

        print("Please Enter the First Name this Entry: ")
        user_changes = gets.chomp
        @@main_hash[user_edit.to_i][0] = user_changes
        print("Please Enter the Last Name this Entry: ")
        user_changes = gets.chomp
        @@main_hash[user_edit.to_i][1] = user_changes
        print("Please Enter the Email for this Entry: ")
        user_changes = gets.chomp
        @@main_hash[user_edit.to_i][2] = user_changes
        print("Please Enter the Section for this Entry: ")
        user_changes = gets.chomp
        @@main_hash[user_edit.to_i][3] = user_changes
        print("Please Enter the Major for this Entry: ")
        user_changes = gets.chomp
        @@main_hash[user_edit.to_i][4] = user_changes
        print("Please Enter the 2nd Major for this Entry: ")
        user_changes = gets.chomp
        @@main_hash[user_edit.to_i][5] = user_changes
        print("Please Enter the Minor for this Entry: ")
        user_changes = gets.chomp
        @@main_hash[user_edit.to_i][6] = user_changes
        print("Please Enter the 2nd Minor for this Entry: ")
        user_changes = gets.chomp
        @@main_hash[user_edit.to_i][7] = user_changes

        puts
        puts("Entry Changed!")
        puts
      elsif selection_2 == "4"
        return
      else
        puts "Error: Please Enter a Valid Selection"
        puts
      end
    end
  end

  #Method 4: Form a Group
  def form_group()
    selection_3 =
    selection_4 =

    loop do
      puts("Please Select How You Would Like to Divide the Groups: ")
      puts("1. Divide by Section")
      puts("2. Divide by Major")
      puts("3. Divide Alphabetically")
      puts("4. Divide by Section and Alphabetically")
      puts("5. Divide by Section and Major")
      puts("6. Divide Randomly")
      puts("7. Return to Main Men")
      puts
      print("Enter your Selection: ")
      selection_3 = gets.chomp

      if selection_3 == "1"
      #  @@group1 = @@main_hash.group_by{|v| v["section"]}.to_h
        @@group1 = @@main_hash.group_by{|v| v["section"]}.to_h
        puts("Divide by Section")
        puts
      elsif selection_3 == "2"
        @@group1 = @@main_hash.group_by{|v| v["major1"]}.to_h
        puts("Divide by Major")
        puts
      elsif selection_3 == "3" #MAKE THIS A HASH
        group_count2 =
        alphabet = Hash.new

        alphabet = @@main_hash.sort_by{|v| v["last_name"]}
        print("Please Select How Many Studnts You Want in Each Group: ")
        group_count2 = gets.chomp
        @@group1 = alphabet.each_slice(group_count2.to_i).to_h

        puts("Divide Alphabetically")
        puts
      elsif selection_3 == "4" #FIX THIS
        alphabet2 = Hash.new

        alphabet2 = @@main_hash.sort_by{|v| v["last_name"]}
        @@group1 = alphabet2.group_by{|v| v["section"]}.to_h
        puts("Divided Alphabetically and by Section")
        puts
      elsif selection_3 == "5" #FIX THIS
        section = Hash.new

        section = @@main_hash.group_by{|v| v["section"]}.to_h
        @@group1 = section.group_by{|v| v["major1".to_i]}.to_h
        puts("Divide by Section and Major")
        puts()
      elsif selection_3 == "6"
        group_count =
        print("Please Select How Many Studnts You Want int Each Group: ")
        group_count = gets.chomp
        @@group1 = @@main_hash.each_slice(group_count.to_i).to_a.shuffle

        puts("Divide Radomly")
        puts
      elsif selection_3 == "7"
        return
      else
        puts "Error: Please Enter a Valid Selection"
        puts
      end
    end
  end

#Method 5: View a Group
  def view_group()
  #  puts(@@main_hash.first.to_h)
    puts(@@main_hash)
#    if @@group1.length == 0
#      print("There is currently no group.")
#    else
#      puts( @@group1
      #  @@group1.each{ |k, v|
      #    puts("(#{k}, #{v}")
      #    if k != @@group1.keys.last
      #      puts(",\n")
      #      puts("\n")
      #    end
      #  }
#      )
#    end
  end

  #Method 6: Export Group Data to File
  def export_group()
    export_file =

    #REPLACE @@main_hash with group array when ready
    if @@group1.length == 0
      puts("There is currently no group.")
      return
    else
      print("Please Enter File Name to Export Data To (.txt File): ")
      export_file = gets.chomp
      File.open(export_file, 'w') do |file|
        @@group1.each{ |k, v|
          file.write("(#{k}, #{v}")
          if k != @@group1.keys.last
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
    puts(Methods.new.view_group)
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
