class Department < ApplicationRecord
  belongs_to :school
  has_many :students dependent: :destroy
  has_many :lecturers dependent: :destroy
  has_many :courses dependent: :destroy

  validates :name, :school_id, presence: true
end
