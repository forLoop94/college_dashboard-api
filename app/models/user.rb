class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :validatable, :jwt_authenticatable, jwt_revocation_strategy: self
  has_one :student, dependent: :destroy
  has_one :lecturer, dependent: :destroy
  has_one :hod, dependent: :destroy
  has_one :dean, dependent: :destroy
end
