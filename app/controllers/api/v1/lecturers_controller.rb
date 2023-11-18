class Api::V1::LecturersController < ApplicationController
  # before_action :authenticate_user!

  def index
    @lecturers = Lecturer.all
    render json: @lecturers
  end

  def show
    @lecturer = Lecturer.find(params[:id])
    render json: @lecturer
  end

  def course_metaData
    @lecturer = Lecturer.find(params[:id])

    @lecturer_courses = @lecturer.courses
    render json: @lecturer_courses
  end


end
