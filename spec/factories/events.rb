require 'factory_girl'

FactoryGirl.define do
  factory :events do
    name Faker::Name.name
    user
  end
end
