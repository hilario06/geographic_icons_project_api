# == Schema Information
#
# Table name: tokens
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  token      :string
#  expires_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Token < ApplicationRecord
  belongs_to :user
  validates :token, :expires_at, :user_id, presence: true
  after_initialize :generate_access_token

  private
  def generate_access_token
    loop do
      self.token = SecureRandom.hex
      break unless Token.where(token: token).any?
    end
    self.expires_at ||= 2.hours.from_now  # se va sumar dos horas
  end
end
