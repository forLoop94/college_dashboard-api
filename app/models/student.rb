class Student < ApplicationRecord
  belongs_to :user
  belongs_to :department
  has_many :grades, dependent: :destroy
  has_many :courses, through: :grades
  has_many :course_with_grades, -> { select('courses.*, grades.value as grade') }, through: :courses, source: :grades

  validates :first_name, :last_name, :level, :gender, :department, :photo, presence: true
  validate :unique_user_student, on: :create

  # def grade_alphabet(score)
  #   if score >= 0 && score < 40
  #     'F'
  #   elsif score >= 40 && score < 45
  #     'E'
  #   elsif score >= 45 && score < 50
  #     'D'
  #   elsif score >= 50 && score < 60
  #     'C'
  #   elsif score >= 60 && score < 70
  #     'B'
  #   else
  #     'A'
  #   end
  # end

  def grade_alphabet(score)
    case score
    when 0...40 then 'F'
    when 40...45 then 'E'
    when 45...50 then 'D'
    when 50...60 then 'C'
    when 60...70 then 'B'
    else 'A'
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

  def calculate_grade_point
    total_quality_points = course_with_grades.reduce(0) do |total, num|
      total + (grade_point(grade_alphabet(num['grade'])) * num['credit_load'])
    end

    total_credit = course_with_grades.reduce(0.0) { |total, num| total + num['credit_load'].to_f }

    if total_credit.zero?
      0.0
    else
      gpa = total_quality_points / total_credit
      gpa.round(2)
    end
  end

  private

  def unique_user_student
    return unless user && Student.exists?(user_id: user.id)

    errors.add(:user, 'already has a student profile')
  end
end
