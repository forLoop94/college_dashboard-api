class Api::V1::LecturerCoursesController < ApplicationController
  def allotment_data
    @hod = Hod.find(params[:id])
    @dept_id = @hod.department_id

    @lecturer_courses = LecturerCourse.includes(:lecturer, :course).where(lecturer: { department_id: @dept_id },
                                                                          course: { department_id: @dept_id })
    render json: @lecturer_courses.to_json(include: { lecturer: {}, course: {} })
  end

  def create
    @lecturer_course = LecturerCourse.new(lecturer_course_params)

    if @lecturer_course.save
      render json: { lecturer_course: @lecturer_course, message: 'Lecturer assigned course successfull' },
             status: :created
    else
      render json: @lecturer_course.errors, message: 'Assignment not successful', status: :unprocessable_entity
    end
  end

  def destroy
    @lecturer_course = LecturerCourse.find(params[:id])

    @lecturer_course.destroy
    render json: { message: 'Assignment successfully removed' }, status: :ok
  end

  private

  def lecturer_course_params
    params.require(:lecturer_course).permit(:lecturer_id, :course_id)
  end
end
