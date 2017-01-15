require 'factory_girl'

FactoryGirl.define do
  factory :authentication do
    uid "MyString"
    provider "MyString"
    oauth_token "MyString"
    user
  end
end
