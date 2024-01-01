class Course < ApplicationRecord
  belongs_to :department
  has_many :lecturer_courses, dependent: :destroy
  has_many :lecturers, through: :lecturer_courses
  has_many :grades, dependent: :destroy
  has_many :students, through: :grades
  has_many :lesson_areas, dependent: :destroy
end
