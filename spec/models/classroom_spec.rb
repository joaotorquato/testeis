require 'rails_helper'

RSpec.describe Classroom, type: :model do
  it { should validate_presence_of :student_id }
  it { should validate_presence_of :course_id }
  it { should validate_presence_of :entry_at }
end
