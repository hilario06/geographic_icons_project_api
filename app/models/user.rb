# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  age             :integer
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_secure_password # para el proceso automatico de encriptacion bcrypt

  has_many :tokens
  validates :email, :password_digest, :age, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :age, numericality: { only_integer: true }
end
