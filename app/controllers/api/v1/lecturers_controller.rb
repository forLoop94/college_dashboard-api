class Api::V1::LecturersController < ApplicationController
  before_action :authenticate_user!

  def index
    @lecturers = Lecturer.all
    render json: @lecturers
  end

  def show
    @lecturer = Lecturer.find(params[:id])
    render json: @lecturer
  end

  def course_list
    @lecturer = Lecturer.find(params[:id])
    @dept_id = @lecturer.department_id
    @courses = Course.includes(:department).where(department_id: @dept_id)

    render json: @courses.to_json(include: :department)
  end

  def assigned_courses
    @lecturer = current_user.lecturer

    @lecturer_courses = @lecturer.courses
    render json: @lecturer_courses
  end

  def create
    @lecturer = current_user.build_lecturer(lecturer_params)

    if @lecturer.save
      render json: { lecturer: @lecturer, message: 'Lecturer successfully created.' }, status: :created
    else
      render json: @lecturer.errors, status: :unprocessable_entity
    end
  end

  def update
    @lecturer = Lecturer.find(params[:id])

    if @lecturer.update(lecturer_params)
      render json: { lecturer: @lecturer, message: 'Lecturer successfully updated.' }, status: :ok
    else
      render json: @lecturer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @lecturer = lecturer.find(params[:id])
    @lecturer.destroy

    render json: { message: 'Lecturer succesfully destroyed' }, status: :ok
  end

  private

  def lecturer_params
    params.require(:lecturer).permit(:first_name, :last_name, :gender, :core_discipline, :number_of_publications,
                                     :highest_academic_qualification, :photo, :rank, :bio, :department_id,
                                     :age, :phone_number, :lga_of_origin)
  end
end
