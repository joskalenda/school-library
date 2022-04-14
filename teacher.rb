require './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name = 'unknown', id = nil)
    super(age, name, true, id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
