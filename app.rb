require_relative 'book'
require_relative 'classroom'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require 'json'

class App
  attr_accessor :people, :books, :rentals

  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def list_books
    if @books.empty?
      puts 'Oops, you have no book yet!'
    else
      @books.each { |book| puts "[Book] Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def list_persons
    if @persons.empty?
      puts 'Oops, you have no person added yet!'
    else
      @persons.each do |person|
        if person.is_a? Student
          print "[Student] Name: #{person.name}, ID: #{person.id} "
          print "Age: #{person.age}, Classroom: #{person.classroom}\n"
        elsif person.is_a? Teacher
          print "[Teacher] Name: #{person.name}, ID: #{person.id} "
          print "Age: #{person.age}, Specialization: #{person.specialization}\n"
        end
      end
    end
  end

  def list_rentals
    if @rentals.empty?
      puts 'Oops, you have taken no rents yet.'
    else
      @rentals.each do |rental|
        if rental.person.is_a? Student
          print "[Rental] Date: #{rental.date}, Title: #{rental.book.title}, Author: #{rental.book.author} "
          print "[Student] Name: #{rental.person.name}, ID: #{rental.person.id} "
          print "Age: #{rental.person.age}, Classroom: #{rental.person.classroom}\n"
        elsif rental.person.is_a? Teacher
          print "[Rental] Date: #{rental.date}, Title: #{rental.book.title}, Author: #{rental.book.author} "
          print "[Teacher] Name: #{rental.person.name}, ID: #{rental.person.id} "
          print "Age: #{rental.person.age}, Specialization: #{rental.person.specialization}\n"
        end
      end
    end
  end

  def add_persons
    puts 'Press 1 to add a student or 2 to add a teacher: '
    option = gets.chomp
    case option
    when '1'
      add_students
    when '2'
      add_teachers
    end
  end

  def add_students
    id = Random.rand(1..1000)
    puts 'Enter name: '
    name = gets.chomp
    puts 'Enter age: '
    age = gets.chomp
    puts 'Enter classroom: '
    classroom = gets.chomp

    student = Student.new(id, age, classroom, name, parent_permission: true)
    @persons.push(student)
    puts 'You successfully added a student!'
  end

  def add_teachers
    id = Random.rand(1..1000)
    puts 'Enter name: '
    name = gets.chomp
    puts 'Enter age: '
    age = gets.chomp
    puts 'Enter specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(id, age, specialization, name, parent_permission: true)
    @persons.push(teacher)
    puts 'You successfully added a teacher!'
  end

  def add_books
    puts 'Enter title: '
    title = gets.chomp
    puts 'Enter author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books.push(book)
    puts 'You successfully added a teacher!'
  end

  def add_rentals
    puts 'Enter the index of the book you want to rent: '
    @books.each_with_index { |book, index| puts "#{index} - Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp.to_i

    puts 'Enter the index of the person who wants to rent the book: '
    @persons.each_with_index do |person, index|
      if person.is_a? Student
        print "#{index} - [Student] Name: #{person.name}, ID: #{person.id} "
        print "Age: #{person.age}, Classroom: #{person.classroom}\n"
      elsif person.is_a? Teacher
        print "#{index} - [Teacher] Name: #{person.name}, ID: #{person.id} "
        print "Age: #{person.age}, Specialization: #{person.specialization}\n"
      end
    end
    person_index = gets.chomp.to_i

    rental = Rental.new(@persons[person_index], @books[book_index])
    @rentals.push(rental)
    puts 'You successfully added a rental!'
  end

  def save_data
    save_books
    save_persons
    save_rentals
  end

  # def load_data
  #   load_books
  #   load_persons
  #   load_rentals
  # end

  private

  def save_books
    File.write('data/books.json', JSON.generate(@books))
  end

  # def load_books
  #   books_data = load_json_from_file('./data/books.json')

  #   if books_data.is_a?(Array)
  #     @books = books_data.map { |book_data| Book.new(book_data['title'], book_data['author']) }
  #   elsif books_data.is_a?(Hash)
  #     @books = [Book.new(books_data['title'], books_data['author'])]
  #   end
  # end

  def save_persons
    File.write('data/persons.json', JSON.generate(@persons))
  end

  # def load_persons
  #   persons_data = load_json_from_file('data/persons.json')

  #   return unless File.exist?('data/persons.json') && !File.empty?('data/persons.json')

  #   persons_data = JSON.parse(File.read('data/persons.json'))
  #   @persons = persons_data.map do |person_data|
  #     if person_data.key?('classroom')
  #       Student.new(person_data['id'], person_data['age'], person_data['classroom'], person_data['name'],
  #                   parent_permission: true)
  #     else
  #       Teacher.new(person_data['id'], person_data['age'], person_data['specialization'], person_data['name'],
  #                   parent_permission: true)
  #     end
  #   end
  # end

  def save_rentals
    File.write('data/rentals.json', JSON.generate(@rentals))
  end

  # def load_rentals
  #   rentals_data = load_json_from_file('data/rentals.json')

  #   return unless File.exist?('data/rentals.json') && !File.empty?('data/rentals.json')

  #   rentals_data = JSON.parse(File.read('data/rentals.json'))
  #   @rentals = rentals_data.map do |rental_data|
  #     book = find_book_by_title(rental_data['book']['title'])
  #     person = find_person_by_id(rental_data['person']['id'])
  #     Rental.new(person, book, Time.parse(rental_data['date']))
  #   end
  # end

#   def load_json_from_file(filename)
#     return {} unless File.exist?(filename)

#     file = File.read(filename)
#     JSON.parse(file)
#   end

#   def find_book_by_title(title)
#     @books.find { |book| book.title == title }
#   end

#   def find_person_by_id(id)
#     @persons.find { |person| person.id == id }
#   end
end
