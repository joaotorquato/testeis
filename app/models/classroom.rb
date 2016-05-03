class Classroom < ActiveRecord::Base
  belongs_to :student
  belongs_to :course
  validates :student_id, :course_id, :entry_at, presence: true
end
