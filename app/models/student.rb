class Student < ApplicationRecord
  belongs_to :user
  belongs_to :department
  has_many :grades, dependent: :destroy
  has_many :courses, through: :grades

  validates :first_name, :last_name, :level, :gender, :department, :photo, presence: true
end
