class User < ApplicationRecord
  has_secure_password
  before_save { email.downcase! }
  validates :name, presence: true, length: { minimum: 6 }
  validates :password_digest, presence: true, length: { minimum: 6 }
  validates :email, presence: true, uniqueness: true,
                    length: { minimum: 10 }, format: { with: URI::MailTo::EMAIL_REGEXP }
end
