class Semester < ApplicationRecord
  has_many :students, dependent: :destroy
  belongs_to :user
end
