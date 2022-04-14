require './decore'
require './rental'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals, :parent_permission

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(age, name = 'unkown', parent_permission = true, id = nil)
    @id = id || Random.rand(1..50)
    @name = name
    @age = age
    @rentals = []
    @parent_permission = parent_permission
    super()
  end
  # rubocop:enable Style/OptionalBooleanParameter

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
person.correct_name
capitalized_person = CapitalizeDecore.new(person)
capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecore.new(capitalized_person)
capitalized_trimmed_person.correct_name
