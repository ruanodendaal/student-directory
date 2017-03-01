@students = [] # an empty array accessible to all methods

def interactive_menu
  loop do
    print_menu
    # read input and pass to process_selection() method
    process_selection(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list"
  puts "4. Load the list"
  puts "9. Exit"
end


def show_students
  print_header
  print_students_list
  print_footer
end


def process_selection(selection)
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
  @name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !@name.empty? do
    puts "Which cohort are they in?"
    @cohort = STDIN.gets.chomp.to_sym

    if @cohort.empty?
      @cohort = "november".to_sym
      puts "\"defaulted to #{cohort}\""
    else
      puts "#{@name} is in #{@cohort} cohort"
      puts "Is this correct? (y / n)"
      response = STDIN.gets.chomp.downcase
        while response != "y"
          puts "Sorry you didn't specify the cohort"
          @cohort = STDIN.gets.chomp.to_sym
          puts "#{@name} is in #{@cohort} cohort"
          puts "Is this correct?"
          response = STDIN.gets.chomp.downcase
        end
    end
    # add the student hash to the array
    add_students
    puts "Now we have #{@students.count} students"
    # gets another name from the user
    @name = STDIN.gets.chomp
  end
end


def add_students
  @students << {name: @name, cohort: @cohort.to_sym}
end


def print_header
  puts "The students of Villains Academy".center(50)
  puts "------------".center(50)
end


def print_students_list
  if @students.count > 0
    @students.each_with_index { |student, i|
      puts "#{i+1}. #{student[:name]} (#{student[:cohort]} cohort)" }
  end
end


def print_footer
  puts "------------".center(50)
  if @students.count >= 2
    puts "Overall, we have #{@students.count} great students".center(50)
  elsif @students.count == 0
    puts "There are no students enrolled".center(50)
  else
    puts "Overall, we have #{@students.count} great student".center(50)
  end
end


def save_students
  puts "What name would you like to give this file?"
  puts "Or would you like to save it in \"students.csv\"?"
  puts "(name inc. extension or 'y' for \"students.csv\"): "
  filename = STDIN.gets.chomp
  filename == "y" ? filename = "students.csv" : filename
  # open file for writing
  file = File.open(filename, "w")
  # iterate over the array of students & save
  @students.each { |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  }
  success_message("Saved")
  file.close
end


def load_students(filename)
  puts "Which file should we load?"
  puts "Or would you like to load \"students.csv\"?"
  puts "(name inc. extension or 'y' for \"students.csv\"): "
  filename = STDIN.gets.chomp
  filename == "y" ? filename = "students.csv" : filename
  
  file = File.open(filename, "r")
  file.readlines.each { |line|
    @name, @cohort = line.chomp.split(',')
    add_students
  }
  success_message("Loaded")
  file.close
end


def success_message(type)
  puts "------------".center(50)
  puts "SUCCESS: #{type} #{@students.count} students".center(50)
  puts "------------".center(50)
end


def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil?
    filename = "students.csv" # set to default if none given
    load_students(filename)
  elsif File.exists?(filename)
    load_students(filename)
    success_message("Loaded")
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu
