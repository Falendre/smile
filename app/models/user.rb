class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :allergies
  has_many :body_types
  has_many :medications
  has_many :underlying_conditions
  has_many :vaccines

  with_options presence: true do
    validates :name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :age
    validates :gender
    validates :birth_day
  end
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'

end
