FactoryGirl.define do
  factory :course do
    sequence(:name) { |n| "Course ##{n}" }
    sequence(:description) { |n| "Description of the Course ##{n}" }
    status CourseStatus::ACTIVE
  end
end
