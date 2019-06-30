class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_many :semesters, dependent: :destroy
  has_many :students, dependent: :destroy
end
