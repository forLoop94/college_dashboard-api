class Dean < ApplicationRecord
  belongs_to :school

  validate :unique_user_dean, on: :create

  private

  def unique_user_dean
    if user && Dean.exists?(user_id: user.id)
      errors.add(:user, "already has a dean's profile")
    end
  end
end
