class CoursesController < ApplicationController
  respond_to :html

  def new
    @course = Course.new
    respond_with @course
  end

  def create
    @course = Course.create(course_params)
    respond_with @course
  end

  def show
    @course = Course.find(params[:id])
    respond_with @course
  end

  private

  def course_params
    params.require(:course).permit(:name, :description)
  end
end
