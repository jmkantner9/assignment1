=begin
Jason Kantner
CSC 415-02
Dr. Pulimood
Assignment 1
=end

require 'csv'

#Declare Variables
selection =
error = false
$main_arr = Hash.new
$group = Array.new

#Method 1: View student data currently stored in the system
def view_data()
  if $main_arr.length == 0
    puts("There is currently no data stored in the system.")
  else
    $main_arr.each_with_index {|val, index| puts "#{val} => #{index}" }
    #$main_arr.each{|val| puts "#{val}"}
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
#  $main_arr = CSV.parse(File.read(file_name), headers: true) #


  #Original Code: Appends onto array but does not split lines into seperate indexes
  #$main_arr.append(File.readlines(file_name).drop(1))

  #Divides lines into indexes, but inputing data replaces what was there before
  #f = File.open(file_name)
  #$main_arr = f.read.split("\n").drop(1)

  #Format similiar to code that divides the lines, but results are same as original code
  #f = File.open(file_name)
  #$main_arr.append(f.read.split("\n").drop(1))

#Method 3: Modify Student Data
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

    if selection_3 == "1"
      puts("Divide by Section")
      return
    elsif selection_3 == "2"
      puts("Divide by Major")
      return
    elsif selection_3 == "3"
      puts("Divide Alphabetically")
      return
    elsif selection_3 == "4"
      puts(split_random(4))

      return
    elsif selection_3 == "5"
      return
    else
      puts "Error: Please Enter a Valid Selection"
      puts
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
  puts("3. Form Groups")
  puts("4. View Value at Index")
  puts("5. Exit Program")
  puts

  print("Enter your Selection: ")
  selection = gets.chomp
  puts

  if selection == "1"
    puts(view_data)
  elsif selection == "2"
    puts(input_data)
  elsif selection == "3"
    puts(form_group)
  elsif selection == "4"
    #$main_arr.each_with_index {|val, index| puts "#{val} => #{index}" }
    puts($main_arr[2])
    puts
  elsif selection == "5"
    puts("Thank You!")
    exit
  else
    puts "Error: Please Enter a Valid Selection"
    puts
  end
end
