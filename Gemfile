# Social-Rails is a fork of socify @sudharti(Sudharsanan Muralidharan)
# Social-Rails is an Open source Social network written in Ruby on Rails.
# @captcussa (Malachai Frazier)
# This file is licensed under GNU GPL v2 or later. See the LICENSE.

source 'https://rubygems.org'
ruby '2.3.1'

gem 'rails',          '5.0.0'
gem 'sass-rails',     '~> 5.0', '>= 5.0.6'
gem 'uglifier',       '~> 3.0', '>= 3.0.4'
gem 'rack',           '~> 2.1' #https://github.com/mkdynamic/omniauth-facebook/issues/247

gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7' # '~> 3.2.0'
gem 'friendly_id',    '~> 5.2' # '~> 5.0'
gem 'will_paginate',  '~> 3.1', '>= 3.1.5'

gem 'counter_culture',        '~> 1.1', '>= 1.1.1'
gem 'acts_as_votable',        '~> 0.10.0'
gem 'omniauth-google-oauth2', '~> 0.4.1' #'~> 0.3.0'
gem 'auto_html',              '~> 1.6.4' # https://github.com/dejan/auto_html/issues/170#issuecomment-179457987

gem 'pg'
gem 'thin'
gem 'jquery-rails'
gem 'autoprefixer-rails'
gem 'jquery-atwho-rails' # Used for auto complete mentions/emojis

gem 'devise'
gem 'carrierwave'
gem 'public_activity'
gem 'acts_as_commentable'
gem 'acts_as_follower'
gem 'populator'

gem 'omniauth'
gem 'omniauth-facebook'
gem 'fog'
gem 'fog-aws'

gem 'sanitize'
gem 'simple_form'
gem 'dropzonejs-rails'
gem 'mini_magick'
gem 'faker'
gem 'figaro'

group :development do
  gem 'letter_opener'
  gem 'spring'
  gem 'sextant'
end

group :development, :test do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-rails'
end

group :production do
  gem 'rails_12factor'
end

group :test do
  gem 'simplecov',        require: false
  gem 'shoulda-matchers', require: false

  gem 'database_cleaner'
  gem 'factory_girl_rails'

  gem 'rspec_candy',              '~> 0.4.1'
  gem 'rspec-rails',              '~> 3.5', '>= 3.5.2'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.1'
  gem 'rspec-activemodel-mocks',  '~> 1.0', '>= 1.0.3'
end
