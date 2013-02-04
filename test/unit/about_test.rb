# == Schema Information
#
# Table name: abouts
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class AboutTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
