require './app'

def list_options
  options = ['Please choose an option by entering a number', '1 - List all books', '2 - List all people',
             '3 - Create a person', '4 - Create a book', '5 - Create a rental',
             '6 - List all rentals for a given person id', '7 - Exit']
  puts
  options.each { |option| puts option }
end

def teacher_student(option)
  case option
  when '1'
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp
    create_person(1, age, name, parent_permission)
    puts 'Person created successfully'
  when '2'
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    create_person(2, age, name, specialization)
    puts 'Person created successfully'
  end
end
