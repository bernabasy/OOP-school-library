require './app'

def list_options
  options = ['Please choose an option by entering a number', '1 - List all books', '2 - List all people',
             '3 - Create a person', '4 - Create a book', '5 - Create a rental',
             '6 - List all rentals for a given person id', '7 - Exit']
  puts
  options.each { |option| puts option }
end
