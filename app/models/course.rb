class Course < ApplicationRecord
  has_many :lecturer_courses, dependent: :destroy
  has_many :lecturers, through: :lecturer_courses
end
