class App
  def initialize
    @booklist = []
    @personlist = []
  end

  def list_books
    if @booklist.length == 0
      puts 'Empty!\n'
    else
      @booklist.each { |index, content| puts '#{index} - #{content}'}
    end
  end

  def list_persons
    if @personlist.length == 0
      puts 'Empty!\n'
    else
      @personlist.each { |index, content| puts '#{index} - #{content}'}
  end

  def create_person(person)
    puts 'Press 1 to create a student or 2 to create a teacher: \n'
    option = gets.chomp
    if option = '1'
      create_student(person)
    elsif option = '2'
      create_teacher(person)
    end
  end

  def create_student(person)
    puts 'Enter name: \n'
    name = gets.chomp
    puts 'Enter age: \n'
    age = gets.chomp
    puts 'Enter classroom: \n'
    classroom = gets.chomp

    student = Student.new(name, age, classroom, parent_permission: true)
    person.push(student)
    puts 'You have successfully added a student!\n'
  end

  def create_teacher(person)
    puts 'Enter name: \n'
    name = gets.chomp
    puts 'Enter age: \n'
    age = gets.chomp
    puts 'Enter specialization: \n'
    specialization = gets.chomp

    teacher = Teacher.new(name, age, specialization)
    person.push(teacher)
    puts 'You have successfully added a teacher!\n'
  end

  app = App.new
  app.list_books
  app.list_persons
end
