class Nameable
  def correct_name
    raise 'NotImplementedError'
  end
end

class Decore < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecore < Decore
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecore < Decore
  def correct_name
    if @nameable.correct_name.length > 10
      @nameable.correct_name.slice(0, 10)
    else
      @nameable.correct_name
    end
  end
end
