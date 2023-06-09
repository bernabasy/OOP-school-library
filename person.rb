require_relative 'nameable'

class Person < Nameable
  def initialize(checker, age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @checker = checker
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  attr_reader :id

  attr_accessor :name, :age, :rentals

  def add_rentals(date, book)
    Rental.new(date, self, book)
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end
