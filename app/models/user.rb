class User < ApplicationRecord
  has_many :user_locations, dependent: :destroy
  has_many :events, through: :user_locations

  before_save {self.email = email.downcase}

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false, message: 'This email adress is already taken' }
  validates :password, presence: true, length: { minimum: 6, message: 'Password needs to be minimum 6 characters long' }

  has_secure_password
end
