=begin
Jason Kantner
CSC 415-02
Dr. Pulimood
Assignment 1
=end

require 'csv'

#Declare Variables
menu_selection=
$main_arr = Hash.new
$group = []

#Method 1: View student data currently stored in the system
def view_data()
  if $main_arr.length == 0
    print("There is currently no data stored in the system.")
  else
    #$main_arr.each{|val| puts "#{val}"}
    $main_arr.each_with_index {|val, index| puts "#{val} => #{index}" }
  end
  puts
end

#Method 2: Input Student Data
def input_data()
  loop do
    file_name = ""
    print("Please Enter a File Name: ")
    file_name = gets.chomp

    if(File.exist?(file_name))
      $main_arr = CSV.parse(File.read(file_name), headers: true) #
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
      user_insert = Array.new
      print("Please Enter Student Data: ")
      user_insert = gets.chomp

      $main_arr.push(Array(user_insert))
      puts("Data Entered!")
      puts
    elsif selection_2 == "2"
      $main_arr.each_with_index {|val, index| puts "#{val} => #{index}" }
      print("Please Enter the Row Number of the Student Entry to Delete: ")
      user_delete = gets.chomp
      $main_arr.delete_at(user_delete.to_i)
      puts("Data Removed!")
      puts
    elsif selection_2 == "3"
      $main_arr.each_with_index {|val, index| puts "#{val} => #{index}"}
      print("Please Enter the Row Number of the Student Entry to Modify: ")
      user_edit = gets.chomp
      print($main_arr[user_edit.to_i])
      puts

      print("Please Enter New Information for this Entry: ")
      user_changes = gets.chomp
      $main_arr[user_edit.to_i].replace(Array(user_changes))

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
    puts("4. Divide Randomly")
    puts("5. Return to Main Men")
    puts
    print("Enter your Selection: ")
    selection_3 = gets.chomp

    if selection_3 == "1" || selection_3 == "2"|| selection_3 == "3" || selection_3 == "4"
        puts("Please Select How Many Groups to Form: ")
        puts("2")
        puts("3")
        puts("4")
        puts
        print("Enter your Selection: ")
        selection_4 = gets.chomp

        if selection_4 == "2"
          puts("Make 2 Groups")
          return
        elsif selection_4 == "3"
          puts("Make 3 Groups")
          return
        elsif selection_4 == "4"
          puts("Make 4 Groups")
          return
        else
          puts("Invalid Option")
          puts
      end
    elsif selection_3 == "5"
      return
    else
      puts "Error: Please Enter a Valid Selection"
      puts
    end
  end
end


#Method 5: View a Group
def view_group()
  if $group.length == 0
    print("There is currently no group.")
  else
    puts($group)
  end
  puts
end

#Method 6: Export Group Data to File
def export_group()
  explot_file = ""

  #REPLACE main_arr with group array when ready
  if $main_arr.length == 0
    puts("There is currently no group.")
    return
  else
    print("Please Enter File Name to Export Data To (.txt File): ")
    export_file = gets.chomp

    File.open(export_file, "w") do |file|
      file.write($main_arr)
    puts("File " + export_file + " Created!")
    end
  end
end

#This section of code is what is shown in the terminal
puts
puts ("Welcome to the Ruby Student Database!")
puts

loop do
  puts ("Please Enter a Number to Select an Option from the List Below:")
  puts("1. View Student Data")
  puts("2. Input Student Data")
  puts("3. Modify Student Data")
  puts("4. Form a Group")
  puts("5. View Current Group")
  puts("6. Export Group Data to File")
  puts("7. Exit Program")
  puts

  print("Enter your Selection: ")
  menu_selection= gets.chomp
  puts

  if menu_selection== "1"
    puts(view_data)
  elsif menu_selection== "2"
    puts(input_data)
  elsif menu_selection== "3"
    puts(modify_data)
  elsif menu_selection== "4"
    puts(form_group)
  elsif menu_selection== "5"
    #puts(view_group)
    puts($main_arr[9])
  elsif menu_selection== "6"
    puts(export_group)
  elsif menu_selection== "7"
    puts("Thank You!")
    exit
  else
    puts "Error: Please Enter a Valid Selection"
    puts
  end
end
