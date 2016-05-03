class Classroom < ActiveRecord::Base
  belongs_to :student, -> { where status: StudentStatus::ACTIVE }
  belongs_to :course, -> { where status: CourseStatus::ACTIVE }
  validates :student_id, :course_id, :entry_at, presence: true
end
