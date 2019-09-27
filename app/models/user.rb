class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :recoverable, :registerable, :validatable
  devise :database_authenticatable,
         :rememberable

  enum role: [:Teacher, :Student]

  validates :name, presence: true

  validates :email, 
    presence: true, 
    uniqueness: true,
    format: { with: Devise.email_regexp, allow_blank: true }
  
  # Validate password
  validates :password, presence: true, on: :create
  validates_length_of :password, within: Devise.password_length, allow_blank: true
  validates :password, confirmation: true, unless: -> { password.blank? }
end
