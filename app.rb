class App
  def initialize
    @booklist = []
    @personlist = []
  end

  def list_books(books)
    if books.empty?
      puts 'You have no books yet!\n'
    else
      books.each do |book|
        puts 'Title: #{book.title}\n'
        puts 'Author: #{book.author}\n'
        puts '------------------\n'
    end
  end

  def list_persons(persons)
    if persons.empty?
      puts 'Oops, no person added yet!\n'
    else
      persons.each do |person|
        puts 'No.: #{person.id}\n'
        puts 'Name: #{person.name}\n'
        puts 'Age: #{person.age}\n'
        puts 'Parent Permission: #{person.parent_permission}\n'
        puts '-----------\n'
      end
    end
  end

  def add_person(person)
    puts 'Press 1 to add a student or 2 to add a teacher: \n'
    option = gets.chomp
    if option = '1'
      add_student(person)
    elsif option = '2'
      add_teacher(person)
    end
  end

  def add_student(person)
    puts 'Enter name: \n'
    name = gets.chomp
    puts 'Enter age: \n'
    age = gets.chomp
    puts 'Enter classroom: \n'
    classroom = gets.chomp

    student = Student.new(name, age, classroom, parent_permission: true)
    person.push(student)
    puts 'You successfully added a student!\n'
  end

  def add_teacher(person)
    puts 'Enter name: \n'
    name = gets.chomp
    puts 'Enter age: \n'
    age = gets.chomp
    puts 'Enter specialization: \n'
    specialization = gets.chomp

    teacher = Teacher.new(name, age, specialization)
    person.push(teacher)
    puts 'You successfully added a teacher!\n'
  end

  def add_books(books)
    puts 'Enter title: \n'
    title = gets.chomp
    puts 'Enter author: \n'
    author = gets.chomp

    book = Book.new(title, author)
    books.push(book)
    puts 'You successfully added a book!\n'
  end

  def add_rentals(persons, books, rentals)
    if persons.empty?
      puts 'Oops, no person to rent. \n'
    elsif books.empty?
      puts 'Oops, no book to rent. \n'
    else
      puts 'Choose a person: \n'
      persons.each{|index, person| puts '#{person.name} - #{person.id} #{person.age}'}
      puts 'Person index: '
      person_index = gets.chomp.to_i

      puts 'Choose a book: \n'
      books.each {|index, book| puts '#{book.id} - #{book.title} #person.author}'}
      puts 'Person index: '
      book_index = gets.chomp.to_i
    end

    rental = Rental.new(persons[person_index], books[book_index])
    rentals.push(rental)
    puts 'You successfully rented a book! \n'
  end

  def list_rentals(persons, rentals)
    if rentals.empty?
      puts 'Oops, you have taken no rents yet! \n'
    else
      puts 'Choose a person by index: \n'
      persons.each {|index, person| puts '#{person.index} - #{person.name}'}
      puts 'Person index: '
      person_index = gets.chomp.to_i
      name = persons[person_index].name
      rentals.each do |rental|
        if rental.person.name = name
          puts rental.rentals
        end
      end
    end
  end

  app = App.new
  app.list_books
  app.list_persons
end
