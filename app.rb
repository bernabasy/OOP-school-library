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
