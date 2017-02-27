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
    # gets another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "------------"
end

def print(students)
  students_specific_letter(students).each_with_index { |student, i|
    puts "#{i+1} #{student[:name]} (#{student[:cohort]} cohort)"
  }
end

def students_specific_letter(students)
  students.select { |students|
    students[:name] =~ /^j/i
  }
end

def print_footer(students)
    puts "Overall, we have #{students_specific_letter(students).count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
