require './nameable'
require './person'

class Decorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.upcase
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name[0, 9]
  end
end

person = Person.new(22, 'maximilianus')
puts person.correct_name
capitalizedperson = CapitalizeDecorator.new(person)
puts capitalizedperson.correct_name
capitalizedtrimmedperson = TrimmerDecorator.new(capitalizedperson)
puts capitalizedtrimmedperson.correct_name
