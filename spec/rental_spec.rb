require './rental'
require './book'
require './person'

describe Rental do
  it 'Rental class intance' do
    book = double('book')
    owner = double('owner')
    date = double('date')
    rentals = []
    expect(book).to receive(:rentals).at_least(:once).and_return(rentals)
    expect(owner).to receive(:rentals).at_least(:once).and_return(rentals)
    rental = Rental.new(date, book, owner)
    expect(rental).to be_an_instance_of(Rental)
  end

  it 'Check if rental attributes matches' do
    date = '111-111-111'
    book = Book.new('Rentalcheck', 'Testing')
    person = Person.new(1, 'Jos')
    rental = Rental.new(date, person, book)
    expect(rental.person.name).to eql('Jos')
    expect(rental.person.age).to eql(1)
    expect(rental.book.title).to eql('Rentalcheck')
    expect(rental.book.author).to eql('Testing')
  end

  it 'Check if add_rental method returns a rental and adds its to the book' do
    book = Book.new('Title', 'Author')
    person = Person.new(1, 'Jos')
    rental = person.add_rental('111-111-111', book)
    expect(person.rentals).to eq [rental]
  end
end
