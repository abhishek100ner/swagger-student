class Student < ApplicationRecord
  belongs_to :user
  belongs_to :semester
end
