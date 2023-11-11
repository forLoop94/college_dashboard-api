class Api::V1::StudentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @students = Student.all
    render json: @students
  end

  def show
    @student = Student.find(params[:id])
    render json: @student
  end

  def course_metadata
    @student = Student.find(params[:id])
    @student_level = @student.level
    @student_dept = @student.department
    @target_courses = Course.where(department: @student_dept, level: @student_level)
    render json: @target_courses
  end
end