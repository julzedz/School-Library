require_relative 'nameable'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
  end

  attr_reader :id
  attr_accessor :name, :age, :rental

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || parent_permission
  end

  def add_rental(date, book)
    Rental.new(date, self, book)
  end

  private

  def of_age?
    @age >= 18
  end
end
