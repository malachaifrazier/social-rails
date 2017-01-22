# Social-Rails is a fork of Socify @sudharti(Sudharsanan Muralidharan)
# Social-Rails is an Open source Social network written in Ruby on Rails.
# @captcussa (Malachai Frazier)
# This file is licensed under GNU GPL v2 or later. See the LICENSE.

module Shared::Callbacks
  extend ActiveSupport::Concern

  included do
    before_destroy :remove_activity
  end

  def remove_activity
    activity = PublicActivity::Activity.find_by(trackable_id: id, trackable_type: self.class.to_s)
    activity.destroy if activity.present?
    true
  end
end
