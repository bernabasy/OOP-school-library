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
