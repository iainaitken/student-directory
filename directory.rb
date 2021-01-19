@students = []

def input_students
  puts "Please enter the name of a student, and hit return"
  puts "To finish, just hit return"
  # get the first name
  name = user_input
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    insert_to_db(name, cohort = "november")
    puts "Now we have #{@students.count} students"
    #get another name from the user
    name = user_input
  end
end

def insert_to_db(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def interactive_menu
  loop do
    print_menu
    process(user_input)
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
      insert_to_db(name, cohort)
  end
  file.close
end

def print_footer
  puts "-------------".center(80)
  puts "Overall, we have #{@students.count} great students".center(80)
end

def print_header
  puts "The students of Villains Academy".center(80)
  puts "-------------".center(80)
end

def print_menu
  puts "-----Menu-----"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
  puts "--------------"
end

def print_students_list
  @students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort].capitalize} cohort)".center(80)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit
    else
      "I don't know what you meant, try again"
  end
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    csv_line = [student[:name], student[:cohort]].join(",")
    file.puts csv_line
  end
  puts "#{@students.count} records saved to file"
  file.close
end

def show_students
  print_header
  print_students_list
  print_footer  
end

def try_load_students
  # first argument from the command line or students.csv if no command line argument passed
  filename = ARGV.empty? ? "students.csv" : ARGV.first 
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if  it doesn't exist
    puts "Sorry, #{filename} does not exist"
    exit # quit the program
  end
end

def user_input
  STDIN.gets.chomp
end

# nothing happens until we call the methods
try_load_students
interactive_menu

=begin
notes for more exercises

1. To solve the DRY problem I created a new method, insert_to_db, with two parameters (name and cohort).
This way, I can invoke the method in two places (load_students and input_students) where we have slightly
different inputs. 

At the same time, I created a new method, user_input, as we were repeating that bit of code three times
(this became particularly apparent when repeatedly prepending STDIN to the code).

2. By providing students.csv as a default filename - we would need to amend try_load_students. I did this 
by using a ternary operator, and then remving the return if nil code, which no longer served a purpose.

3. Refactoring. See 1 above for user_input. Also:

Shortened save_students by taking out the variable student_data, which I don't think adds anything to the code;
[student[:name], student[:cohort]].join is readable without the additional variable.

Removed option 4 from print_menu and process(selection) as loading students.csv now takes place automatically; 
if the load fails the program exits, so there are no circumstances in which a manual load would take place.

Centered text when showing students - this makes the list stand out from the command line commands.  Also added a 
second set of dashes and capitalised the cohort.

Amended the instructions in input_students, which did not match the actions the user needs to take (you 
only need to hit return once to exit, and you are entering a single student at a time)

4. Only one of the three actions needs feedback (save the list of students).  input_students already has feedback
when records are successfully added, and when show_students is selected, the user sees the printed items.  


=end