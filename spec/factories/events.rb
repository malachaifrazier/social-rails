require 'factory_girl'

FactoryGirl.define do
  factory :event do
    name {Faker::Name.name}
    user
  end
end
