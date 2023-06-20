class person
  attr_reader :id,
  attr_accessor :name
  attr_accessor :age
  def initialize(id, name = "Unknown", age, parent_permission = true)
    @id  = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
end