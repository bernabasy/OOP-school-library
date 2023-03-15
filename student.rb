require './person'

class Student < person
  attr_reader :classroom

  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def add_class(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end
end
