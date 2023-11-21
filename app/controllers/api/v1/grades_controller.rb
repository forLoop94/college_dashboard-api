class Api::V1::GradesController < ApplicationController
  before_action :authenticate_user!

  def index
    @grades = Grade.all

    render json: @grades
  end

  def create
    @grade = Grade.new(grade_params)

    if @grade.save
      render json: { grade: @grade, message: "Grade successfully created" }, status: :ok
    else
      render json: @grade.errors, message: "Grade could not be created.", status: :unprocessable_entity
    end
  end

  def update
    @grade = Grade.find(params[:id])

    if @grade.update(grade_params)
      render json: { grade: @grade, message: "Grade updated successfully." }, status: :ok
    else
      render json: @grade.errors, message: "Grade could not be updated", status: :unprocessable_entity
    end
  end

  def destroy
    @grade = Grade.find(params[:id])

    @grade.destroy
    render json: { message: "Grade deleted succesfully" }, status: :ok
  end

  private

  def grade_params
    params.require(:grade).permit(:value, :student_id, :course_id)
  end
end
