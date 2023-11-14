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
    @student = Student.includes(:department).find(params[:id])
    @student_courses = @student.grades_with_values
    render json: @student_courses
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      render json: { student: @student, message: 'Student successfully created.' }, status: :created
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      render json: { student: @student, message: 'Student successfully updated.' }, status: :ok
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    render json: { message: 'student succesfully destroyed' }, status: :ok
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :photo, :phone_number, :level, :gender, :department, :age, :bio, :lga_of_origin, :user_id)
  end
end
