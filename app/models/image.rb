# == Schema Information
#
# Table name: images
#
#  id            :integer          not null, primary key
#  photo         :string(255)
#  imagable_id   :integer
#  imagable_type :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Image < ActiveRecord::Base
   resourcify
  attr_accessible :photo
  belongs_to :imagable, :polymorphic => true
  mount_uploader :photo, PhotoUploader
end
