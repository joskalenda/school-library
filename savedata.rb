# require 'json'

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
end
