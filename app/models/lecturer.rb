class Lecturer < ApplicationRecord
  belongs_to :user
  belongs_to :department
  has_many :lecturer_courses, dependent: :destroy
  has_many :courses, through: :lecturer_courses

  validate :unique_user_lecturer, on: :create

  private

  def unique_user_lecturer
    if user && Lecturer.exists?(user_id: user.id)
      errors.add(:user, "already has a lecturer profile")
    end
  end
end
