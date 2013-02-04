# == Schema Information
#
# Table name: tables
#
#  id         :integer          not null, primary key
#  table_name :integer
#

class Table < ActiveRecord::Base
   #attr_accessible :title, :body
  has_many :customers, :dependent=>:destroy
attr_accessor :no_of_tables
  

end
