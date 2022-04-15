require './person'
require './teacher'

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

    it 'Check if can run services method runs fine' do  
      teacher = Teacher.new(1, name: 'Jos', specialization: 'Developer')
      expect(teacher.can_use_services?).to be(true)
    end
end