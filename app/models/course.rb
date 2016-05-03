class Course < ActiveRecord::Base
  validates :name, :description, presence: true
  has_enumeration_for :status, with: CourseStatus, create_helpers: true
  before_create :set_status

  def set_status
    self.status = CourseStatus::ACTIVE
  end
end
