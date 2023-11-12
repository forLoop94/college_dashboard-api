class School < ApplicationRecord
  has_one :dean
  has_many :departments dependent: :destroy

  validates :name, presence: true
end
