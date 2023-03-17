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
