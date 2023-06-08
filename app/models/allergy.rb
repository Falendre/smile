class Allergy < ApplicationRecord
  belongs_to :user

  validates :kinds, presence: true
end