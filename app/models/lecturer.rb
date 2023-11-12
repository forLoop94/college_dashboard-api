class Lecturer < ApplicationRecord
  belongs_to :user
  belongs_to :department
  has_many :lecturer_courses, dependent: :destroy
  has_many :courses, through: :lecturer_courses
end
