=begin
students = [ 
  {name: "Dr. Hannibal Lecter", cohort: :december, hobbies: "Cooking", country_of_birth: "USA", height: "178cm"},
  {name: "Darth Vader", cohort: :november, hobbies: "The Force", country_of_birth: "Space", height: "187cm"},
  {name: "Nurse Ratched", cohort: :november, hobbies: "Nursing", country_of_birth: "USA", height: "159cm"},
  {name: "Michael Corleone", cohort: :october, hobbies: "Shooting", country_of_birth: "Italy", height: "174cm"},
  {name: "Alex DeLarge", cohort: :november, hobbies: "Tiddlywinks", country_of_birth: "USA", height: "169cm"},
  {name: "The Wicked Witch of the West", cohort: :october, hobbies: "Wearing a pointy hat", country_of_birth: "Oz", height: "158cm"},
  {name: "Terminator", cohort: :december, hobbies: "Search and destroy", country_of_birth: "USA", height: "190cm"},
  {name: "Freddy Krueger", cohort: :november, hobbies: "Arts and crafts", country_of_birth: "USA", height: "180cm"},
  {name: "The Joker", cohort: :november, hobbies: "Comedy", country_of_birth: "USA", height: "172cm"},
  {name: "Joffrey Baratheon", cohort: :december, hobbies: "Despotism", country_of_birth: "Westeros", height: "167cm"},
  {name: "Norman Bates", cohort: :november, hobbies: "Hospitality", country_of_birth: "USA", height: "181cm"}
]
=end

def input_students
  # create an empty array
  students = []
  # get the first name
  
  while true
    puts "Please enter a name, or press return to exit"
    name = gets
    name.gsub!(/\n/,"")
    if !name.empty?
      puts "Please enter a cohort"
      cohort = gets.chomp.downcase.to_sym
      #add the student hash to the array
      students << {name: name, cohort: cohort}
      puts "Now we have #{students.count} #{students.count == 1 ? "student" : "students"}"
    else
      break
    end
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(60)
  puts "-------------".center(60)
end

def print(students)
  
  if !students.empty?
    # iterate through students, create array of cohorts
    cohorts = []
    students.each do |student|
      cohorts << student[:cohort]
    end
    # iterate through that array, print each student in students where the cohort matches
    cohorts.uniq.each do |cohort|
      students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)".center(60) if student[:cohort] == cohort }
    end
  end  
  
end

def print_footer(students)
  puts "Overall, we have #{students.count} great #{students.count == 1 ? "student" : "students"}".center(60)
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)

