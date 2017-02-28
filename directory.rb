@students = [] # an empty array accessible to all methods

def interactive_menu
  loop do
    # 1. print the menu and ask the user what to do
    print_menu
    # read input and pass to process() method
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
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
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit # will cause program to terminate
  else
    puts "I don't know what you mean, try again"
  end
end


def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # gets another name from the user
    name = STDIN.gets.chomp
  end
end


def print_header
  puts "The students of Villains Academy".center(50)
  puts "------------".center(50)
end


def print_students_list
  if @students.count > 0
    @students.each_with_index { |student, i|
      puts "#{i+1} #{student[:name]} (#{student[:cohort]} cohort)" }
  end
end


def print_footer
  puts "------------".center(50)
  if @students.count > 1
    puts "Overall, we have #{@students.count} great students".center(50)
  else
    puts "Overall, we have #{@students.count} great student".center(50)
  end
end


def save_students
  # open file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students & save
  @students.each { |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  }
  file.close
end


def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each { |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  }
  file.close
end


def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu
