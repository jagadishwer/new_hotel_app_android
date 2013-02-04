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

class SwipeCard < ActiveRecord::Base
  resourcify
  attr_accessible :card_no, :balance
  has_many :transactions
  belongs_to :users
  #after_initialize :init
  #def init
    #self.count ||= 15
    #self.user_id ||= current_user
    #self.cancel_item ||= false
  #end
  validates :card_no, :uniqueness => true, :presence=>true


def self.search(search)
  if search
    where('card_no LIKE ?', "%#{search}%")
  else
    scoped
  end
end


end
