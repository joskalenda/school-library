class Person

  def initialize(name= 'unkown', age, parent_permission: true)
    @id = Random.rand(1..50)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # accessor get method for id
  attr_reader :id

  # accessor get and set method
  attr_accessor :name
  attr_accessor :age

  private #check if this is private

    def is_of_age?
      if @gae >= 18
        return true
      else 
        return false
      end
    end
  
  def can_use_services?
    return true if is_of_age? || parent_permission == true

  end


end