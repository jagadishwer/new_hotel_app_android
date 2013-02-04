# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Counter.create(:name=>'Bakery')
Counter.create(:name=>'Cocktails')
Counter.create(:name=>'main_counter')
Counter.create(:name=>'Indian')

#Kitchen.create(:name=>'Bakery')

Role.create(:name=>'manager')
Role.create(:name=>'moderator')
Role.create(:name=>'till_operator')
Role.create(:name=>'kitchen')
Role.create(:name=>'admin')