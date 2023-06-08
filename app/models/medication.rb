class Medication < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :prescription_date, presence: true
end
