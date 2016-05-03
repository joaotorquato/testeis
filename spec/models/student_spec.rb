require 'rails_helper'

describe Student, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :register_number }

  it 'creates a student with status active' do
    student = Student.new(name: 'Joao Silva', register_number: 1_231_231)

    student.save

    expect(student.status).to eq StudentStatus::ACTIVE
  end
end
