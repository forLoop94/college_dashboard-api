class Student < ApplicationRecord
  belongs_to :user
  belongs_to :department
  has_many :grades, dependent: :destroy
  has_many :courses, through: :grades
  has_many :grades_with_values, -> { select('courses.*, grades.value as grade') }, through: :courses, source: :grades

  validates :first_name, :last_name, :level, :gender, :department, :photo, presence: true
end
