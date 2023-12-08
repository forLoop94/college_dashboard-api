class Api::V1::LessonAreaController < ApplicationController
  def create
    @lesson_area = LessonArea.new(lesson_area_params)

    if @lesson_area.save
      render json: {lesson_area: @lesson_area, message: "Lesson area created successfully"}, status: :created
    else
      render json: @lesson_area.errors, message: "Lesson area could not be created", status: :unprocessable_entity
    end
  end

  private

  def lesson_area_params
    params.require(:lesson_area).permit(:student_id, :course_id, :lecturer_id)
  end
end
