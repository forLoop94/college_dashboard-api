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
      course.as_json.merge(symbol: grade_alphabet(course["grade"]), points: grade_point(grade_alphabet(course["grade"])))
    end
    @student_courses.push({gpa: grade_point_calculator(@student_courses)})

    render json: @student_courses
  end

  def create
    @student = Student.new(student_params)

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

  def grade_alphabet(score)
    if score >= 0 && score < 40
      'F'
    elsif score >= 40 && score < 45
      'E'
    elsif score >= 45 && score < 50
      'D'
    elsif score >= 50 && score < 60
      'C'
    elsif score >= 60 && score < 70
      'B'
    else
      'A'
    end
  end

  def grade_point(symbol)
    case symbol
    when 'A'
      5
    when 'B'
      4
    when 'C'
      3
    when 'D'
      2
    when 'E'
      1
    else
      0.2
    end
  end

  def grade_point_calculator(grades_info)
    total_quality_points = grades_info.reduce(0) do |total, num|
      total + (grade_point(grade_alphabet(num["grade"])) * num["credit_load"])
    end

    total_credit = grades_info.reduce(0) { |total, num| total + num["credit_load"] }

    gpa = total_quality_points / total_credit
    gpa.round(2)
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :photo, :phone_number, :level, :gender, :department_id, :age, :bio, :lga_of_origin, :user_id)
  end
end

