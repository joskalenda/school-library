require './person'

class Student < Person
  def initialize(classroom, age, name = 'unknowm', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
