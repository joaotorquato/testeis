class ClassroomsController < ApplicationController
  def new
    @classroom = Classroom.new
  end

  def create
    @classroom = Classroom.new(classroom_params)
    if @classroom.save
      flash[:success] = 'Student was enrolled successfuly'
      redirect_to @classroom
    else
      render :new
    end
  end

  def show
    @classroom = Classroom.find(params[:id])
  end

  private

  def classroom_params
    params.require(:classroom).permit(:student_id, :course_id, :entry_at)
  end
end
