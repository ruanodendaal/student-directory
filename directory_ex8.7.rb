def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  name = gets.chomp.capitalize
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Which cohort are they in?"
    cohort = gets.chomp.to_sym

    if cohort.empty?
      cohort = "november".to_sym
      puts "\"defaulted to #{cohort}\""
    else
      puts "#{name} is in #{cohort} cohort"
      puts "Is this correct?"
      response = gets.chomp.downcase
        while response != "yes"
          puts "Which cohort are they in?"
          cohort = gets.chomp.to_sym
          puts "#{name} is in #{cohort} cohort"
          puts "Is this correct?"
          response = gets.chomp.downcase
        end
    end

    puts "What's their favourite hobbie?"
    hobby = gets.chomp.capitalize
    puts "Where were they born?"
    birth_country = gets.chomp.capitalize
    puts "How tall are they? (in cm)"
    height = gets.chomp
    # add the student hash to the array
    students << {name: name, cohort: cohort, hobby: hobby, birth_country: birth_country, height: height}
    # gets another name from the user
    puts "Next person (or return to finish)"
    name = gets.chomp.capitalize
  end

  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "------------".center(50)
end

def print(students)
  students.each_with_index { |student, i|
    puts "#{i+1}. #{student[:name]} likes #{student[:hobby]}".rjust(5)
    puts "was born in #{student[:birth_country]}".rjust(10)
    puts "and is #{student[:height]}cm tall (#{student[:cohort]} cohort)".rjust(10)
  }
end

def print_footer(students)
  puts "------------".center(50)
  puts "Overall, we have #{students.count} great students".center(50)
end

students = input_students
print_header
print(students)
print_footer(students)
