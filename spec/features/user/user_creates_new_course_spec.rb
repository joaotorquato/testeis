require 'rails_helper'

feature 'User creates a new course' do
  scenario 'successfuly' do
    course = build(:course)

    visit new_course_path

    fill_in 'Name', with: course.name
    fill_in 'Description', with: course.description

    click_on 'Create'

    expect(page).to have_content course.name
    expect(page).to have_content course.description
  end

  scenario 'unsuccessfuly', js: true do
    visit new_course_path

    click_on 'Create'

    # should validate fields via javascript
    expect(current_path).to eq new_course_path
    %w(name description).each do |field|
      within ".course_#{field}" do
        expect(page).to have_content "can\'t be blank"
      end
    end
  end
end
