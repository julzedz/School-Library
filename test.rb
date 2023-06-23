require './person'
require './decorator'

# TEST DECORATORS
# person = Person.new(22, 'maximilianus')
# puts person.correct_name
# capitalizedperson = CapitalizeDecorator.new(person)
# puts capitalizedperson.correct_name
# capitalizedtrimmedperson = TrimmerDecorator.new(capitalizedperson)
# puts capitalizedtrimmedperson.correct_name

# TEST RELATIONSHIP BETWEEN CLASSROOM AND STUDENTS
# classroom1 = Classroom.new('Class 1')
# student1 = Student.new(1, 30, classroom1, 'Jules')
# puts student1.inspect
