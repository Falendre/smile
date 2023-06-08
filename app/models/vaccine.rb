class Vaccine < ApplicationRecord
  belongs_to :user

  validates :vaccine_name, presence: true
  validates :vaccination_date, presence: true
end
