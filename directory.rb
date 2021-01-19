@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
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
  puts "Overall, we have #{@students.count} great students"
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def print_students_list
  @students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
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
    when "4"
      load_students
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
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def show_students
  print_header
  print_students_list
  print_footer  
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
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
