def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit # will cause program to terminate
    else
      puts "I don't know what you mean, try again"
    end
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # gets another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "------------".center(50)
end

def print(students)
  students.each_with_index { |student, i| puts "#{i+1} #{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer(students)
  puts "------------".center(50)
  if students.count > 1
    puts "Overall, we have #{students.count} great students".center(50)
  else
    puts "Overall, we have #{students.count} great student".center(50)
  end
end

students = interactive_menu
print_header
print(students)
print_footer(students)
