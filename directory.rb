@students = [] # an empty array accessible to all methods

def interactive_menu
  loop do
    # 1. print the menu and ask the user what to do
    print_menu
    # read input and pass to process() method
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end


def show_students
  print_header
  print_students_list
  print_footer
end


def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit # will cause program to terminate
  else
    puts "I don't know what you mean, try again"
  end
end


def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # gets another name from the user
    name = gets.chomp
  end
end


def print_header
  puts "The students of Villains Academy".center(50)
  puts "------------".center(50)
end


def print_students_list
  @students.each_with_index { |student, i| puts "#{i+1} #{student[:name]} (#{student[:cohort]} cohort)" }
end


def print_footer
  puts "------------".center(50)
  if @students.count > 1
    puts "Overall, we have #{@students.count} great students".center(50)
  else
    puts "Overall, we have #{@students.count} great student".center(50)
  end
end

@students = interactive_menu
print_header
print(@students)
print_footer(@students)
