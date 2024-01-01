class Api::V1::DepartmentsController < ApplicationController
  def index
    @departments = Department.includes(:school).all
    render json: @departments.to_json(include: :school)
  end

  def dean_index
    role_data = current_user.send(current_user.role.downcase)
    @school_id = role_data.school_id
    @departments = Department.where(school_id: @school_id)
    @departments_count = @departments.count

    @departments_list = @departments.map do |dept|
      dept.as_json.merge!(count: @departments_count)
    end

    render json: @departments_list
  end

  def show
    @department = Department.find(params[:id])
    render json: @department
  end

  def create
    @department = Department.new(dept_params)

    if @department.save
      render json: { department: @department, message: 'Department created succesfully' }, status: :created
    else
      render json: @department.errors, message: 'Department could not be created', status: :unprocessable_entity
    end
  end

  def destroy
    @department = Department.find(params[:id])

    @department.destroy
    render json: { message: 'Department deleted successfully' }, status: :ok
  end

  private

  def dept_params
    params.require(:department).permit(:name, :school_id)
  end
end
