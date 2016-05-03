require 'rails_helper'

describe Course, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }

  it 'creates a course with status active' do
    course = Course.new(name: 'Course #1',
                        description: 'description of the course #1')

    course.save

    expect(course.status).to eq CourseStatus::ACTIVE
  end
end
