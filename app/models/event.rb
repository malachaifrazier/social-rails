# Social-Rails is a fork of Socify @sudharti(Sudharsanan Muralidharan)
# Social-Rails is an Open source Social network written in Ruby on Rails.
# @captcussa (Malachai Frazier)
# This file is licensed under GNU GPL v2 or later. See the LICENSE.

class Event < ActiveRecord::Base
  include Shared::Callbacks
  belongs_to :user
  acts_as_votable
  acts_as_commentable

  include PublicActivity::Model
  tracked only: [:create], owner: proc { |_controller, model| model.user }

  validates_presence_of :name
  validates_presence_of :when
  validates_presence_of :user

end
