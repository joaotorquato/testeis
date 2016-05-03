class ClassroomsController < ApplicationController
  respond_to :html

  def index
    @students = Student.all_active
    @courses = Course.all_active
    @classrooms = Classroom.all
    respond_with @students, @courses, @classrooms
  end

  def new
    @classroom = Classroom.new
    respond_with @classroom
  end

  def create
    @classroom = Classroom.create(classroom_params)
    respond_with @classroom, location: -> { root_path }
  end

  private

  def classroom_params
    params.require(:classroom).permit(:student_id, :course_id, :entry_at)
  end
end
