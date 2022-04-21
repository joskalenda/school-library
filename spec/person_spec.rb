require './person'

describe Person do
  it 'Person class instance' do
    person = Person.new(1, 'Jos', true)
    expect(person.id).to be_between(0, 50)
    expect(person).to be_instance_of(Person)
  end

  it 'Check if person attribute match' do
    person = Person.new(1, 'Jos', true)
    expect(person).to have_attributes(name: 'Jos', age: 1, parent_permission: true)
  end

  it 'Check if correct name method is correct' do
    person1 = Person.new(1, 'Microverse', true)
    expect(person1.correct_name).to eql 'Microverse'
  end
end
