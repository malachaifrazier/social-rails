require 'factory_girl'

FactoryGirl.define do
  factory :authentications do
    uid "MyString"
    provider "MyString"
    oauth_token "MyString"
    user
  end
end
