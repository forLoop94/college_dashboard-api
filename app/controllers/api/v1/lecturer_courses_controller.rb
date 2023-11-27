class Api::V1::LecturerCoursesController < ApplicationController
  def index
    @lecturerCourse = LecturerCourse.includes(:lecturer, :course).all
    render json: @lecturerCourse.to_json(include: :lecturer, :course)
  end

  def create
    @lecturerCourse = LecturerCourse.new(lecturerCourse_params)

    if @lectureCourse.save
      render json: { lecturerCourse: @lectureCourse, message: "Lecturer assigned course successfull" }, status: :created
    else
      render json: @lecturerCourse.errors, message: "Assignment not successful", status: :unprocessable_entity
    end
  end

  def destroy
    @lecturerCourse = LecturerCourse.find(params[:id])

    @lectureCourse.destroy
    render json: { message: "Assignment successfully removed" }, status: :ok
  end

  private

  def lecturerCourse_params
    params.require(:lectureCourse).permit(:lecturer_id, :course_id)
  end
end
