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

def option_create_book
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  create_book(title, author)
  puts 'Book created successfully'
end

def option_create_person
  print 'Do you want to createa student (1) or a teacher (2)? [Input the number]: '
  create = gets.chomp
  teacher_student(create)
end

def option_create_rental
  puts 'Select a book from the following list by number'
  state = list_rent_books
  if state == 'empty'
    puts 'Books shelf is empty.'
    return
  end
  book_no = gets.chomp
  puts 'Select a person from the folowing list by number (not id)'
  person_present = list_rent_people
  if person_present == 'empty'
    puts 'There are no people to list.'
    return
  end
  person_no = gets.chomp
  print 'Date: '
  date = gets.chomp
  create_rental(person_no, book_no, date)
  puts 'Rental created sucessfully'
end

def option_list_rentals
  print 'ID of person: '
  person_id = gets.chomp
  list_rental(person_id)
end

def exit
  puts 'Thank you for using this app.'
end

def invalid_option
  puts 'Kindly enter a valid option'
end

def parameter_option(parameter)
  options = {
    '1' => method(:list_books),
    '2' => method(:list_people),
    '3' => method(:option_create_person),
    '4' => method(:option_create_book),
    '5' => method(:option_create_rental),
    '6' => method(:option_list_rentals),
    '7' => method(:exit)
  }

  option_method = options[parameter] || method(:invalid_option)
  option_method.call
end

def main
  app = App.new
  app.begin_console
end

main
