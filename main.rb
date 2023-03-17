require './app'

def list_options
  options = ['Please choose an option by entering a number', '1 - List all books', '2 - List all people',
             '3 - Create a person', '4 - Create a book', '5 - Create a rental',
             '6 - List all rentals for a given person id', '7 - Exit']
  puts
  options.each { |option| puts option }
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
