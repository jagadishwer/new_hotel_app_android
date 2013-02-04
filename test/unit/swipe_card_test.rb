# == Schema Information
#
# Table name: swipe_cards
#
#  id         :integer          not null, primary key
#  card_no    :string(255)
#  balance    :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

require 'test_helper'

class SwipeCardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
