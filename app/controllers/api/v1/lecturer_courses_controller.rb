class Api::V1::LecturerCoursesController < ApplicationController
  def allotment_data
    @hod = Hod.find(params[:id])
    @dept_id = @hod.department_id

    @lecturerCourses = LecturerCourse.includes(:lecturer, :course).where(lecturer: { department_id: @dept_id }, course: { department_id: @dept_id })
    render json: @lecturerCourses.to_json(include: { lecturer: {}, course: {} })
  end

  def create
    @lecturerCourse = LecturerCourse.new(lecturerCourse_params)

    if @lecturerCourse.save
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
    params.require(:lecturer_course).permit(:lecturer_id, :course_id)
  end
end
