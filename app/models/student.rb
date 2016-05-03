class Student < ActiveRecord::Base
  validates :name, :register_number, presence: true
  has_enumeration_for :status, with: StudentStatus, create_helpers: true
  has_many :courses, through: :classrooms
  before_create :set_status

  def set_status
    self.status = StudentStatus::ACTIVE
  end
end
