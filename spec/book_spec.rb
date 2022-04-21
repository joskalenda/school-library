require './book'

describe Book do
  it 'Book class instance' do
    title = 'Ruby made simple'
    author = 'Topaz'
    @book = Book.new(title, author)
    expect(@book).to be_instance_of(Book)
  end

  it 'Check if book attribute match' do
    title = 'Na relax'
    author = 'Koko G'
    book = Book.new(title, author)
    expect(book).to have_attributes(title: title, author: author)
  end
end
