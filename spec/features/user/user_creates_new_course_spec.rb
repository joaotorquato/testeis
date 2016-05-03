require 'rails_helper'

feature 'User creates a new course' do
  scenario 'successfuly' do
    course = build(:course)

    visit new_course_path

    fill_in 'course[name]', with: course.name
    fill_in 'course[description]', with: course.description

    click_on 'Registrar Curso'

    within('.courses-list') do
      expect(page).to have_content course.name
    end
  end

  scenario 'unsuccessfuly', js: true do
    visit new_course_path

    click_on 'Registrar Curso'

    # should validate fields via javascript
    expect(current_path).to eq new_course_path
    %w(name description).each do |field|
      within ".course_#{field}" do
        expect(page).to have_content "não pode ficar em branco"
      end
    end
  end
end
