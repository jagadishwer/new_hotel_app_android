# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  email      :string(255)
#  address    :text
#  phone_no   :string(255)
#  fax_no     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Contact < ActiveRecord::Base
   resourcify
  #attr_accessible :address, :email, :fax_no, :phone_no, :title
end
