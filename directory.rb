@students = []

def interactive_menu
    loop do
    print_menu
    process(gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    @students = input_students
  when "2"
    show_students
  when "9"
    exit #this will cause the program to terminate
  else
    puts "I don't know what you meant, please try again"
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
  print_footer(@students)
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each.with_index do |student, index|
    puts "#{index}: #{student[:name].center(20)} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{@students.count} great students"
end

def input_students
  loop do
    puts "Please the names of the student"
    puts "To finish, just hit return"
    name = gets.chop
    break if name.empty?
    puts "Please enter the cohort of the student"
    cohort = gets.chop
    if cohort.empty?
      cohort = "unassigned"
    end
    @students << {name: name, cohort: cohort}
    puts "Now we have #{@students.count} students"
  end
  @students
end

interactive_menu
