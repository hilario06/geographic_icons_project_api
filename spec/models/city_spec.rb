# == Schema Information
#
# Table name: cities
#
#  id                    :bigint           not null, primary key
#  denomination          :string
#  number_of_inhabitants :integer          default(0)
#  totat_surface_area    :float
#  country_id            :bigint           not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
require 'rails_helper'

RSpec.describe City, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
