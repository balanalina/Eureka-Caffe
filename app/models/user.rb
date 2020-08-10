class User < ApplicationRecord
  has_secure_password
  before_save { email.downcase! }
  validates :name, presence: true
  validates :password_digest, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
