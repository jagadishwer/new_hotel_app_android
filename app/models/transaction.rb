# == Schema Information
#
# Table name: transactions
#
#  id                  :integer          not null, primary key
#  swipe_card_id       :integer
#  counter_id          :string(255)
#  cost                :string(255)
#  type_of_transaction :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  balance             :float
#  user_id             :integer
#

class Transaction < ActiveRecord::Base
  # attr_accessible :title, :body
   resourcify
  belongs_to :swipe_card
  def card
    (SwipeCard.find(self.swipe_card_id)).card_no
  end
  def counter
    (Counter.find(self.counter_id)).name
  end
  def transaction_type
    case self.type_of_transaction
    when 1
      "credit"
    when 2
       "debit"
    else
       "unknown"
    end
  end
#  def remaining
#    (SwipeCard.find(self.swipe_card_id)).balance
#  end
end
