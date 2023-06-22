require './nameable'

class Person < Nameable
  def initialize(_id, age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1...1000)
    @age = age
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_accessor :name, :age

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end
