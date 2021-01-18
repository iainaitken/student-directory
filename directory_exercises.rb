
students = [ 
  {name: "Dr. Hannibal Lecter", cohort: :november, hobbies: "Cooking", country_of_birth: "USA", height: "178cm"},
  {name: "Darth Vader", cohort: :november, hobbies: "The Force", country_of_birth: "Space", height: "187cm"},
  {name: "Nurse Ratched", cohort: :november, hobbies: "Nursing", country_of_birth: "USA", height: "159cm"},
  {name: "Michael Corleone", cohort: :november, hobbies: "Shooting", country_of_birth: "Italy", height: "174cm"},
  {name: "Alex DeLarge", cohort: :november, hobbies: "Tiddlywinks", country_of_birth: "USA", height: "169cm"},
  {name: "The Wicked Witch of the West", cohort: :november, hobbies: "Wearing a pointy hat", country_of_birth: "Oz", height: "158cm"},
  {name: "Terminator", cohort: :november, hobbies: "Search and destroy", country_of_birth: "USA", height: "190cm"},
  {name: "Freddy Krueger", cohort: :november, hobbies: "Arts and crafts", country_of_birth: "USA", height: "180cm"},
  {name: "The Joker", cohort: :november, hobbies: "Comedy", country_of_birth: "USA", height: "172cm"},
  {name: "Joffrey Baratheon", cohort: :november, hobbies: "Despotism", country_of_birth: "Westeros", height: "167cm"},
  {name: "Norman Bates", cohort: :november, hobbies: "Hospitality", country_of_birth: "USA", height: "181cm"}
]

=begin
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end
=end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  i = 0
  l = students.length
  while i < l
    puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort)"
    i += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# nothing happens until we call the methods
# students = input_students
print_header
print(students)
print_footer(students)

