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

  def course_list
    @lecturer = Lecturer.find(params[:id])
    @deptId = @lecturer.department_id
    @courses = Course.where(department_id: @deptId)

    render json: @courses
  end

  def course_metaData
    @lecturer = Lecturer.find(params[:id])

    @lecturer_courses = @lecturer.courses
    render json: @lecturer_courses
  end

  def create
    @lecturer = Lecturer.new(lecturer_params)

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
    params.require(:lecturer).permit(:first_name, :last_name, :gender, :core_discipline, :number_of_publications, :highest_academic_qualification, :photo, :rank, :bio, :department_id, :age, :phone_number, :lga_of_origin, :user_id)
  end
end
