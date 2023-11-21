class Api::V1::CoursesController < ApplicationController
  # before_action :authenticate_user!

  def index
    @courses = Course.all
    render json: @courses
  end

  def show
    @course = Course.find(params[:id])

    render json: @course
  end

  def course_students
    @course = Course.find(params[:id])

    @course_students = @course.students
    render json: @course_students
  end

  
end
