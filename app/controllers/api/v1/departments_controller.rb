class Api::V1::DepartmentsController < ApplicationController
  def index
  @departments = Department.all
  render json: @departments
  end

  def show
  @department = Department.find(params[:id])
  render json: @department
  end

  def create
    @department = Department.new(dept_params)

    if @department.save
      render json: { department: @department, message: "Department created succesfully" }, status: :created
    else
      render json: @department.errors, message: "Department could not be created", status: :unprocessable_entity
    end
  end

  private

  def dept_params
    params.require(:department).permit(:name, :school_id)
  end
end
