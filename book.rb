class Book
  attr_accessor :title, :author, :rental

  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end
end
