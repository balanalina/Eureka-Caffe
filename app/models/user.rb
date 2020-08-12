class User < ApplicationRecord
  attr_accessor :remember_token
  has_secure_password
  before_save { email.downcase! }
  validates :name, presence: true, length: { minimum: 6 }
  validates :password_digest, presence: true, length: { minimum: 6 }
  validates :email, presence: true, uniqueness: true,
                    length: { minimum: 10 }, format: { with: URI::MailTo::EMAIL_REGEXP }

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
               BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil )
  end
  
  def authenticated?(remember_token)
    BCrypt::Password::new(remember_digest).is_password?(remember_token)
  end
end
