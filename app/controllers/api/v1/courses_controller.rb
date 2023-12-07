class Api::V1::CoursesController < ApplicationController
  before_action :authenticate_user!

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

    @dept_id = @course.department_id
    @level = @course.level
    @course_students = Student.where(department_id: @dept_id, level: @level)
    render json: @course_students
  end

  def specific_course_students
    @course = Course.find(params[:id])

    @course_students = @course.students
    render json: @course_students
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      render json: { course: @course, message: 'Course created successfully' }, status: :created
    else
      render json: @course.errors, message: 'Course could not be created', status: :unprocessable_entity
    end
  end

  def update
    @course = Course.find(params[:id])

    if @course.update(course_params)
      render json: { cousre: @course, message: 'Course successfully updated' }, status: :ok
    else
      render json: @course.errors, message: 'Course could not be updated', status: :unprocessable_entity
    end
  end

  def destroy
    @course = Course.find(params[:id])

    @course.destroy
    render json: { message: 'Course succesfully deleted' }, status: :ok
  end

  private

  def course_params
    params.require(:course).permit(:title, :code, :level, :department_id, :credit_load)
  end
end
