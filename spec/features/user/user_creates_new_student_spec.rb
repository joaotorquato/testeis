require 'rails_helper'

feature 'User creates a new student' do
  scenario 'successfuly' do
    student = build(:student)

    visit new_student_path

    fill_in 'student[name]', with: student.name
    fill_in 'student[register_number]', with: student.register_number

    click_on 'Registrar Estudante'

    within('.students-list') do
      expect(page).to have_content student.name
      expect(page).to have_content student.register_number
    end
  end

  scenario 'unsuccessfuly', js: true do
    visit new_student_path

    click_on 'Registrar Estudante'

    # should validate fields via javascript
    expect(current_path).to eq new_student_path
    %w(name register_number).each do |field|
      within ".student_#{field}" do
        expect(page).to have_content "não pode ficar em branco"
      end
    end
  end
end
