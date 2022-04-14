require './person'

class Student < Person
  attr_reader :classroom

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(age, classroom, name = 'unknowm', parent_permission = true, id = nil)
    super(age, name, parent_permission, id)
    @classroom = classroom
  end
  # rubocop:enable Style/OptionalBooleanParameter

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
