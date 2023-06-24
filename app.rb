class App
  def initialize
    @booklist = []
    @personlist = []
  end

  def list_books
    if @booklist.length == 0
      puts "Empty"
    else
      @booklist.each { |index, content| puts '#{index} - #{content}'}
    end
  end

  def list_persons
    if @personlist.length == 0
      puts 'Empty'
    else
      @personlist.each { |index, content| puts '#{index} - #{content}'}
  end

  app = App.new
  app.list_books
  app.list_persons
end
