require_relative './classes/book'
require_relative './classes/student'
require_relative './classes/teacher'
require_relative './classes/person'
require_relative './classes/rental'

def option1
  puts "** Books **"
  ObjectSpace.each_object(Book) do |obj|
    puts "Title: #{obj.title} Author: #{obj.author}"
  end
end

def option2
  puts "** Teachers **"
  ObjectSpace.each_object(Teacher) do |obj|
    puts "Id: #{obj.id} Name: #{obj.name} Age: #{obj.age} Specialization: #{obj.specialization}"
  end
  puts "** Students **"
  ObjectSpace.each_object(Student) do |obj|
    puts "Id: #{obj.id} Name: #{obj.name} Age: #{obj.age}"
  end
end

def option4
  puts 'Title:'
  title = gets.chomp
  puts 'Author:'
  author = gets.chomp

  Book.new(title, author)
  puts "Book created successfully"
end

def option5
  book_array = ObjectSpace.each_object(Book).to_a
  person_array = ObjectSpace.each_object(Person).to_a

  if(book_array.empty?)
    puts "Add some books first..."
  elsif (person_array.empty?)
    puts "Add some people first..."
  else
    puts "Select a Book Number from the following list"
    book_array.each_with_index do |book, index|
      puts "#{index + 1}. #{book.title} - #{book.author}"
    end
    puts 'Book Number:'
    book_number = gets.chomp.to_i

    puts "Select a Person Number from the following list (not id)"
    person_array.each_with_index do |person, index|
      puts "#{index + 1}. #{person.class.name} #{person.name} - id: #{person.id}"
    end
    puts 'Person Number:'
    person_number = gets.chomp.to_i

    puts 'Date (dd-mm-yy):'
    date = gets.chomp

    Rental.new(date, person_array[person_number - 1], book_array[book_number - 1])
    puts "Rental created successfully"
  end
end

def option6
  puts "ID of person:"
  id = gets.chomp.to_i

  ObjectSpace.each_object(Person) do |person|
    if(person.id == id)
      person.rentals.each {|rental| puts "Date: #{rental.date} Book: #{rental.book.title} by #{rental.book.author}" }
    end
  end


end

def option_student
  puts 'Age:'
  age = gets.chomp
  puts 'Name:'
  name = gets.chomp
  puts 'Has parent permission? [Y/N]'
  permission = gets.chomp
  permission = permission.upcase
  if (permission == 'N')
    permission = 2
  end
  permission = 1

  Student.new(age.to_i, name, permission)
  puts "Student created successfully"
end

def option_teacher
  puts 'Age:'
  age = gets.chomp
  puts 'Specialization:'
  specialization = gets.chomp
  puts 'Name:'
  name = gets.chomp

  Teacher.new(age.to_i, specialization, name, 1)
  puts "Teacher created successfully"
end

# s1 = Student.new(15, "choco", 1)
# b1 = Book.new('www', 'dsd')
# date = '01-01-2023'
# r1 = Rental.new(date, s1, b1)
# puts b1.rentals
