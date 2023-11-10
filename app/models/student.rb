class Student < ApplicationRecord
  belongs_to :users

  validates :first_name, :last_name, :level, :gender, :department, :photo, presence: true
end
