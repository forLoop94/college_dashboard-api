class Api::V1::HodsController < ApplicationController
  def index
    @hods = Hods.all
    render json: @hods
  end

  def show
    @hod = Hod.find(params[:id])
    render json: @hod
  end

  def create
    if current_user
      @hod = current_user.build_hod(hod_params)

      if @hod.save
        render json: { hod: @hod, message: 'HOD successfully created' }, status: :created
      else
        render json: { errors: @hod.errors, message: 'HOD could not be created' }, status: :unprocessable_entity
      end
    else
      render json: { message: 'User not authenticated' }, status: :unauthorized
    end
  end

  def department_students
    @department_id = current_user.hod.department_id

    @students = Student.includes(:department).where(department_id: @department_id)
    render json: @students.to_json(include: :department)
  end

  def department_lecturers
    @department_id = current_user.hod.department_id

    @lecturers = Lecturer.includes(:department).where(department_id: @department_id)
    render json: @lecturers.to_json(include: :department)
  end

  def department_courses
    @department_id = current_user.hod.department_id

    @courses = Course.includes(:department).where(department_id: @department_id)
    render json: @courses.to_json(include: :department)
  end

  def update
    @hod = Hod.find(params[:id])

    if @hod.update(hod_params)
      render json: { hod: @hod, message: 'HOD successfully updated' }, status: :ok
    else
      render json: @hod.errors, message: 'HOD could not be updated', status: :unprocessable_entity
    end
  end

  def destroy
    @hod = Hod.find(params[:id])

    @hod.destroy
    render json: { message: 'HOD successfully deleted' }, status: :ok
  end

  private

  def hod_params
    params.require(:hod).permit(:first_name, :last_name, :gender, :years_of_admin_exp, :number_of_publications,
                                :highest_academic_qualification, :photo, :rank, :bio, :department_id,
                                :age, :phone_number, :lga_of_origin)
  end
end
