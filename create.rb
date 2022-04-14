require 'json'
require './savedata'

class CreatePeople
  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def create_person
    print 'To create a student, press 1, to create a teacher, press 2 : '
    option = gets.chomp
    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid input. Try again'
    end
  end

  def create_student
    puts 'Create a new student'
    print 'Enter student age: '
    age = gets.chomp.to_i
    print 'Enter name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase
    case parent_permission
    when 'n'
      Student.new(age, 'classroom', name, false)
      @persons << student
      puts 'Student doesnt have parent permission, cant rent books'
    when 'y'
      student = Student.new(age, 'classroom', name, true)
      @persons << student
      puts 'Student created successfully'
    end
  end

  def create_teacher
    puts 'Create a new teacher'
    print 'Enter teacher age: '
    age = gets.chomp.to_i
    print 'Enter teacher name: '
    name = gets.chomp
    print 'Enter teacher specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @persons << teacher
    puts 'Teacher created successfully'
  end

  def create_book
    puts 'Create a new book'
    print 'Enter title: '
    title = gets.chomp
    print 'Enter author: '
    author = gets
    book = Book.new(title, author)
    @books.push(book)
    puts "Book #{title} created successfully."
  end

  def create_rental
    puts 'Select which book you want to rent by entering its number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }

    book_id = gets.chomp.to_i

    puts 'Select a person from the list by its number'
    @persons.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_id = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp.to_s

    rental = Rental.new(date, @persons[person_id], @books[book_id])
    @rentals << rental

    puts 'Rental created successfully'
  end
end
