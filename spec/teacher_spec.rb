require './teacher'

describe Teacher do
  it 'Teacher class instance' do
    teacher = Teacher.new(1, 'Jos', 'Math')
    expect(teacher).to be_instance_of(Teacher)
  end

  it 'Check if person attribute match' do
    teacher = Teacher.new(1, 'Math', 'Jos')
    expect(teacher).to have_attributes(age: 1, specialization: 'Math', name: 'Jos')
  end

  it 'Check if can run services method runs fine' do
    teacher = Teacher.new(1, name: 'Jos', specialization: 'Developer')
    expect(teacher.can_use_services?).to be(true)
  end
end
