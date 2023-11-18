class Hod < ApplicationRecord
  belongs_to :department

  validate :unique_user_hod, on: :create

  private

  def unique_user_hod
    if user && Hod.exists?(user_id: user.id)
      errors.add(:user, "already has an HOD profile")
    end
  end
end
