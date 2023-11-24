class Student < ApplicationRecord
  belongs_to :user
  belongs_to :department
  has_many :grades, dependent: :destroy
  has_many :courses, through: :grades
  has_many :course_with_grades, -> { select('courses.*, grades.value as grade') }, through: :courses, source: :grades

  validates :first_name, :last_name, :level, :gender, :department, :photo, presence: true
  validate :unique_user_student, on: :create

  private

  def unique_user_student
    if user && Student.exists?(user_id: user.id)
      errors.add(:user, "already has a student profile")
    end
  end

end
