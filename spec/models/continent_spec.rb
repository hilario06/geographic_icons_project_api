# == Schema Information
#
# Table name: continents
#
#  id           :bigint           not null, primary key
#  denomination :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe Continent, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
