class Student < ApplicationRecord
  belongs_to :user
  belongs_to :department

  validates :first_name, :last_name, :level, :gender, :department, :photo, presence: true
end
