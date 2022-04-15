require './classroom'

describe Classroom do
  it 'Classroom class instance' do
    classroom = Classroom.new('classroom')
    expect(classroom).to be_instance_of(Classroom)
  end

  it 'Check if class is initialization works' do
    classroom = Classroom.new('classroom')
    student = double('student')
    expect(student).to receive(:classroom=).with(classroom)
    classroom.add_student(student)
    expect(classroom.students).to contain_exactly(student)
  end

  it 'Check add student method' do
    student1 = Student.new(44, 'English', 'Nuri', true)
    english_class = Classroom.new('English')
    english_class.add_student(student1)
    expect(english_class.students[0].name).to eq 'Nuri'
  end

  it 'Chech if class attribute matches' do
    classroom = Classroom.new('classroom')
    expect(classroom).to have_attributes(label: 'classroom')
  end
end
