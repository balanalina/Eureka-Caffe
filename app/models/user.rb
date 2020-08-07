class User < ApplicationRecord
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  before_save { email.downcase! }
  validates :name, presence: true
  validates :password_digest, presence: true
  validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL_REGEX}
end
