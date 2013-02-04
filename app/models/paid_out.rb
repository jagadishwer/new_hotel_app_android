# == Schema Information
#
# Table name: paid_outs
#
#  id         :integer          not null, primary key
#  amount     :float
#  reason     :string(255)
#  to         :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class PaidOut < ActiveRecord::Base
  # attr_accessible :title, :body
   resourcify
  belongs_to :user
#  after_initialize :init
#  def init
#    #self.count ||= 15
#    self.user_id ||= current_user.id
#    #self.cancel_item ||= false
#  end
end
