class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :recoverable, :registerable
  devise :database_authenticatable,
         :rememberable, :validatable

  enum role: [:teacher, :student]
end
