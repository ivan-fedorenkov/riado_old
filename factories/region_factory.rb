require 'faker'

FactoryGirl.define do
  factory :region do
    name { Faker::Name.name }
  end
end
