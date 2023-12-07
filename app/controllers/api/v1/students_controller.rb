class Api::V1::StudentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @students = Student.all.includes(:department)
    render json: @students.to_json(include: :department)
  end

  def show
    @student = Student.find(params[:id])
    render json: @student
  end

  def recommended_courses
    @student = current_user.student
    @student_dept = @student.department_id
    @student_level = @student.level

    @rec_courses = Course.includes(:department).where(department_id: @student_dept, level: @student_level)
    render json: @rec_courses.to_json(include: :department)
  end

  def course_grade
    @student = current_user.student
    @student_courses = @student.course_with_grades.map do |course|
      course.as_json.merge(symbol: @student.grade_alphabet(course['grade']),
                           points: @student.grade_point(@student.grade_alphabet(course['grade'])),
                           gpa: @student.calculate_grade_point)
    end
    render json: @student_courses
  end

  def student_messages
    @student_id = current_user.student.id
    @course_id = Course.find(params[:course_id])
    @lecturer_id = Lecturer.find(params[:id])

    @chat_room = LessonArea.find_by(student_id: @student_id, course_id: @course_id, lecturer_id: @lecturer_id)

    if @chat_room
      @chats = @chat_room.chats
      render json: @chats
    else
      render json: { error: 'No chat room found' }, status: :not_found
    end
  end

  def create
    @student = Student.new(student_params)
    @student = current_user.build_student(student_params)

    if @student.save
      render json: { student: @student, message: 'Student successfully created.' }, status: :created
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      render json: { student: @student, message: 'Student successfully updated.' }, status: :ok
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    render json: { message: 'student succesfully destroyed' }, status: :ok
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :photo, :phone_number, :level, :gender, :department_id,
                                    :age, :bio, :lga_of_origin)
  end
end
