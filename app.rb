require 'json'
require './person'
require './student'
require './teacher'
require './book'
require './classroom'
require './rental'
require './print_script'

class App < PrintScript
  def initialize
    super
    @iomanager = IOmanager.new
    @books = @iomanager.fetch_book_data
    @persons = @iomanager.fetch_person_data
    @rentals = @iomanager.fetch_rental_data
  end

  def list_all_books
    puts 'Database is empty! Add a book.' if @books.empty?
    @books.each { |book| puts "[Book] Title: #{book.title}, Author: #{book.author}" }
  end

  def list_all_persons
    puts 'Database is empty! Add a person.' if @persons.empty?
    @persons.each do |person|
      puts "[#{person.class.name}] Name: #{person.name}, Age: #{person.age}, id: #{person.id}"
    end
  end

  def list_all_rentals
    print 'To see person rentals enter the person ID: '
    id = gets.chomp.to_i

    puts 'Rented Books:'
    @rentals.each do |rental|
      if rental.person.id == id
        puts "Peson: #{rental.person.name}  Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
      else
        puts
        puts '...'
      end
    end
  end

  def json_runner
    @iomanager.save_book(@books)
    @iomanager.save_people(@persons)
    @iomanager.save_rental(@rentals)
  end
end
