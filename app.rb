require './book'
require './student'
require './teacher'
require './person'
require './rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def begin_console
    i = 0
    loop do
      list_options
      i = gets.chomp
      parameter_option(i)
      break if i == '7'
    end
  end

  def create_book(title, author)
    @books << Book.new(title, author)
  end

  def list_books()
    puts 'Books shelf is empty.' if @books.empty?
    @books.each { |book| puts "Title: \"#{book.title}\" Author: #{book.author}" }
  end

  def create_person(checker, age, name, parent_permission)
    @people << if checker == 1
                 Student.new(checker, age, parent_permission, name)
               else
                 Teacher.new(parent_permission, age, name)
               end
  end

  def list_people()
    puts 'There are no people to list.' if @people.empty?
    @people.each do |person|
      if person.is_a?(Student)
        puts "[Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      else
        puts "[Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def list_rent_books
    return 'empty' if @books.empty?

    @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\" Author: #{book.author}" }
  end

  def list_rent_people
    return 'empty' if @people.empty?

    @people.each_with_index do |person, index|
      if person.is_a?(Student)
        puts "#{index}) [Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      else
        puts "#{index}) [Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_rental(person, book, date)
    @rentals << Rental.new(@people[person.to_i], @books[book.to_i], date)
  end

  def list_rental(id)
    book_rent = ''
    @rentals.each do |rental|
      if id.to_i == rental.person.id
        book_rent += "#{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author} \n"
      end
    end
    puts 'There is no rental for the selected id' if book_rent.empty?
    print book_rent
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
end
