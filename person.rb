require './decore'
require './rental'

class Person < Nameable
  def initialize(age, name = 'unkown', parent_permission: true)
    @id = Random.rand(1..50)
    @name = name
    @age = age
    @rental = []
    @parent_permission = parent_permission
    super()
  end

  # accessor get method for id
  attr_reader :id

  # accessor get and set method
  attr_accessor :name, :age, :rental

  def add_rental(date, book)
    Rental.new(date, self, book)
  end

  def can_use_services?
    return true if _of_age? || parent_permission
  end

  def correct_name
    @name
  end

  private # check if this is private

  def _of_age?
    @gae >= 18
  end
end
person = Person.new(22, 'maximilianus')
p person.correct_name
capitalized_person = CapitalizeDecore.new(person)
p capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecore.new(capitalized_person)
p capitalized_trimmed_person.correct_name
