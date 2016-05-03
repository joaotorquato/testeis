class ClassroomsController < ApplicationController
  respond_to :html

  def new
    @classroom = Classroom.new
    respond_with @classroom
  end

  def create
    @classroom = Classroom.create(classroom_params)
    respond_with @classroom
  end

  def show
    @classroom = Classroom.find(params[:id])
    respond_with @classroom
  end

  private

  def classroom_params
    params.require(:classroom).permit(:student_id, :course_id, :entry_at)
  end
end
