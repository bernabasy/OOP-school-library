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
end
