class User < ApplicationRecord
  has_secure_password # para el proceso automatico de encriptacion bcrypt

  validates :email, :password_digest, :age, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :age, numericality: { only_integer: true }
end
