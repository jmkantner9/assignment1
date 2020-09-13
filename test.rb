=begin
Jason Kantner
CSC 415-02
Dr. Pulimood
Assignment 1
=end

require 'csv'
require 'enumerator'

class Methods

  #keys = ["first_name", "last_name", "email", "section", "major1", "major2", "minor1", "minor2"]
  @@main_hash = Hash.new#[keys.each_with_object(nil).to_a]
  @@group1 = Hash.new
  @@group2 = Hash.new

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

  #Method 1: View student data currently stored in the system
  def view_data()
    if @@main_hash.length == 0
      print("There is currently no data stored in the system.")
    else
      #@@main_hash.each{|val| puts "#{val}"}
      @@main_hash.each_with_index {|val, index| puts "#{val} => #{index}" }
    end
    puts
  end

  #Method 2: Input Student Data
  def input_data()
    #setName = Hash.new
    loop do
      file_name = ""
      print("Please Enter a File Name: ")
      file_name = gets.chomp

    #  initialize = CSV.parse(File.read(file_name), headers: true)
    #  puts("Data Entered!")
    #  return

      if(File.exist?(file_name))

        @@main_hash = CSV.parse(File.read(file_name), headers: true)#
        puts("Data Entered!")
        return

        #file = File.open(file_name).each do |line|
        #  if line.split.length == 8
      #      first_name, last_name, email, section, major1, major2, minor1, minor2 = line.chomp.split(" ")
      #      @first_name = first_name
      #      @last_name = last_name
      #      @email = email
      #      @section = section
      #      @major1 = major1
      #      @major2 = major2
      #      @minor1 = minor1
      #      @minor2 = minor2
      #    end
      #    setName[first_name] = first_name
      #  end
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
        @@group1 = @@main_hash.group_by{|x| x["section"]}.to_h

        puts("Divide by Section")
        puts
      elsif selection_3 == "2"
        @@group1 = @@main_hash.group_by{|x| x["major1"]}.to_h
        puts("Divide by Major")
        puts
      elsif selection_3 == "3" #MAKE THIS A HASH
        group_count2 =
        alphabet = Hash.new

        alphabet = @@main_hash.sort_by{|x| x["last_name"]}
        print("Please Select How Many Studnts You Want in Each Group: ")
        group_count2 = gets.chomp
        @@group1 = alphabet.each_slice(group_count2.to_i).to_a

        puts("Divide Alphabetically")
        puts
      elsif selection_3 == "4" #FIX THIS
        alphabet2 = Hash.new

        alphabet2 = @@main_hash.sort_by{|x| x["last_name"]}
        @@group1 = alphabet2.group_by{|x| x["section"]}.to_h
        puts("Divided Alphabetically and by Section")
        puts()
      elsif selection_3 == "5" #FIX THIS
        section = Hash.new

        section = @@main_hash.group_by{|x| x["section"]}.to_h
        @@group1 = section.group_by{|x| x["major1".to_i]}.to_h
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

    #  puts(@@main_hash.find_all{|row| row["section"] == "9"})
    #  puts(@@main_hash.count{|row| row["section"] == "9"})
    #puts(@@main_hash.count{|row| row["section"] == "9")
    #puts(@@main_hash[0]["section"])

    #puts(@@main_hash[1]["section".to_i])
    puts(@@group1)
    #puts(@@group2)
    #puts(@@group3)

  #  if @@group1.length == 0 || @@group2.length == 0
  #    print("There is currently no group.")
#    else
#      puts(@@group1)
#      puts(@@group2)
#    end
#    puts
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

      File.open(export_file, "w") do |file|
        file.write(@@group1)
      puts("File " + export_file + " Created!")
      end
    end
  end

end

#THIS SECTION OF CODE GENERATES THE MAIN MENU AND CALLS OBJECTS FROM THE METHODS CLASS
menu_selection =

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
    exit
  else
    puts "Error: Please Enter a Valid Selection"
    puts
  end
end
