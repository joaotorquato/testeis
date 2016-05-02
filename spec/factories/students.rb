FactoryGirl.define do
  factory :student do
    sequence(:name) { |n| "Student ##{n}" }
    sequence(:register_number) { |n| "2016#{n}" }
    status StudentStatus::ACTIVE
  end
end
