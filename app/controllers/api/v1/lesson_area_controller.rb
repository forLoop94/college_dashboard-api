class Api::V1::LessonAreaController < ApplicationController
  def create
    @lesson_area = LessonArea.new(lesson_area_params)

    if @lesson_area.save
      render json: {lesson_area: @lesson_area, message: "Lesson area created successfully"}, status: :created
    else
      render json: @lesson_area.errors, message: "Lesson area could not be created", status: :unprocessable_entity
    end
  end

  def student_lesson
    @student_id = Student.find(params[:student_id])
    @course_id = Course.find(params[:course_id])
    @lecturer_id = Lecturer.find(params[:id])

    @chat_room = LessonArea.find_by(student_id: @student_id, course_id: @course_id, lecturer_id: @lecturer_id)
    if @chat_room
      render json: @chat_room
    else
      render json: nil
    end
  end

  private

  def lesson_area_params
    params.require(:lesson_area).permit(:student_id, :course_id, :lecturer_id)
  end
end
