require 'rails_helper'

describe ClassroomsController do
  describe 'POST #create' do
    context 'when all fields are filled' do
      it 'renders the show page' do
        student = create(:student)
        course = create(:course)
        classroom_atributes = attributes_for(:classroom,
                                             course_id: course.id,
                                             student_id: student.id)

        post :create, classroom: classroom_atributes

        expect(response).to redirect_to(root_path)
        expect(flash[:notice])
          .to match(/^Student was enrolled successfuly/)
      end
    end
  end
end
