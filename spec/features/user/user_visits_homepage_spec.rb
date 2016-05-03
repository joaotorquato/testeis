require 'rails_helper'

feature 'User visits the homepage' do
  scenario 'successfuly' do
    students = create_list(:student, 5)
    courses = create_list(:course, 5)
    classroom = create(:classroom,
                       course: courses.first,
                       student: students.first)

    visit root_path

    within('.students-list') do
      students.each do |student|
        expect(page).to have_content student.name
        expect(page).to have_content student.register_number
      end
      expect(page).to have_link 'New student'
    end

    within('.courses-list') do
      courses.each do |course|
        expect(page).to have_content course.name
      end
      expect(page).to have_link 'New course'
    end

    within('.classrooms-list') do
      expect(page). to have_content classroom.student.name
      expect(page). to have_content classroom.course.name
      expect(page). to have_content classroom.entry_at.strftime("%d/%m/%Y")
      expect(page).to have_link 'New enrollment'
    end
  end
end
