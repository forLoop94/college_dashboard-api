class Student < ApplicationRecord
  belongs_to :user

  validates :first_name, :last_name, :level, :gender, :department, :photo, presence: true
end
