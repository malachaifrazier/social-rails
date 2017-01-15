# Social-Rails is a fork of Socify @sudharti(Sudharsanan Muralidharan)
# Social-Rails is an Open source Social network written in Ruby on Rails.
# @captcussa (Malachai Frazier)
# This file is licensed under GNU GPL v2 or later. See the LICENSE.

module Shared::Photos
  extend ActiveSupport::Concern
  def fetch_photos
    @photos = Photo.latest(@user, 9)
  end
end
