class Rental
  attr_accessor :date
  attr_reader :person

  def initialize(date, person)
    @date = date
    @person = person
    person.rental << self
  end
end
