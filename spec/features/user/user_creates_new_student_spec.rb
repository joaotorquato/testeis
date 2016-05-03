require 'rails_helper'

feature 'User creates a new student' do
  scenario 'successfuly' do
    student = build(:student)

    visit new_student_path

    fill_in 'Name', with: student.name
    fill_in 'Register number', with: student.register_number

    click_on 'Create'

    expect(page).to have_content student.name
    expect(page).to have_content student.register_number
  end

  scenario 'unsuccessfuly', js: true do
    visit new_student_path

    click_on 'Create'

    # should validate fields via javascript
    expect(current_path).to eq new_student_path
    %w(name register_number).each do |field|
      within ".student_#{field}" do
        expect(page).to have_content "can\'t be blank"
      end
    end
  end
end
