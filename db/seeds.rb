#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

FactoryGirl.create(:region, :name => 'Российская Федерация', :default => true)
FactoryGirl.create(:region, :name => 'Москва')
FactoryGirl.create(:region, :name => 'Санкт-Петербург')
FactoryGirl.create(:region, :name => 'Чеченская Республика')
