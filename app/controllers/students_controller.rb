class StudentsController < ApplicationController
  respond_to :html

  def new
    @student = Student.new
    respond_with @student
  end

  def create
    @student = Student.create(student_params)
    respond_with @student
  end

  def show
    @student = Student.find(params[:id])
    respond_with @student
  end

  private

  def student_params
    params.require(:student).permit(:name, :register_number)
  end
end
