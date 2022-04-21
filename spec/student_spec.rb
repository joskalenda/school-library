require './student'

describe Student do
  before :each do
    # moc the classroom using the double method
    @moc = double('classroom')
    @student = []
    allow(@moc).to receive(:students).and_return(@student)
  end

  it 'Check if it can store the student data' do
    student = Student.new(12, name: 'Mathew', classroom: @moc)
    student.classroom = @moc
    expect(@student.length).to be(1)
    expect(@student).to contain_exactly(student)
  end

  it 'Check if attributes values matches' do
    student = Student.new(1, 'Microverse', 'Jos', true)
    expect(student).to have_attributes(name: 'Jos', age: 1, classroom: 'Microverse', parent_permission: true)
  end

  it 'Test student class ' do
    student = Student.new(1, 'Microverse', 'Jos', true)
    microverse = Classroom.new('Web Dev')
    student.classroom = microverse
    expect(student.classroom.label).to eq 'Web Dev'
    expect(microverse.students.count).to eq 1
  end
end
