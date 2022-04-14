require 'json'

class IOmanager
  def save_book(books)
    file = File.open('./book.json', 'a')
    book_data = books.map do |data|
      { title: data.title, author: data.author }
    end
    file.puts(JSON.generate(book_data))
  end

  def fetch_book_data
    return [] unless File.exist?('./books.json')

    file = File.read('./books.json')
    array = []
    if file.empty?
      array
    else
      parsed_data = JSON.parse(file)
      parsed_data.map do |data|
        array.push(Book.new(data['title'], data['author']))
      end
    end
    array
  end

  def save_people(persons)
    file = File.open('./people.json', 'a')
    person_data = persons.map do |person|
      if person.instance_of?(Teacher)
        { occupation: 'Teacher', name: person.name, age: person.age, specialization: person.specialization }
      else
        { occupation: 'Student', name: person.name, age: person.age, parent_permission: person.parent_permission }
      end
    end
    file.puts(JSON.generate(person_data))
  end

  def save_rental(rentals)
    file = File.open('./rental.json', 'a')
    rentals_data = rentals.map do |rental|
      { created_on: rental.date, book: { Title: rental.book.title, Author: rental.book.author }, p_Id: rental.person.id }
    end
    file.puts(JSON.generate(rentals_data))
  end
end

