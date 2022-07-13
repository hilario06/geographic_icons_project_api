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
end
