require 'rails_helper'

feature 'User enrolls a student' do
  scenario 'successfuly' do
    student = create(:student)
    course = create(:course)

    visit new_classroom_path

    select student.name, from: 'classroom[student_id]'
    select course.name, from: 'classroom[course_id]'
    select '2016', from: 'classroom[entry_at(1i)]'
    select 'Maio', from: 'classroom[entry_at(2i)]'
    select '1', from: 'classroom[entry_at(3i)]'

    click_on 'Registrar Matrícula'

    within('.classrooms-list') do
      expect(page).to have_content student.name
      expect(page).to have_content course.name
      expect(page).to have_content '01/05/2016'
    end
  end

  scenario 'unsuccessfuly', js: true do
    create(:student)
    create(:course)

    visit new_classroom_path

    click_on 'Registrar Matrícula'

    # should validate fields via javascript
    expect(current_path).to eq new_classroom_path
    %w(student course).each do |field|
      within ".classroom_#{field}" do
        expect(page).to have_content "não pode ficar em branco"
      end
    end
  end
end
