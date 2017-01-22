# Social-Rails is a fork of Socify @sudharti(Sudharsanan Muralidharan)
# Social-Rails is an Open source Social network written in Ruby on Rails.
# @captcussa (Malachai Frazier)
# This file is licensed under GNU GPL v2 or later. See the LICENSE.

class Photo < ActiveRecord::Base
  counter_culture :photo_album
  belongs_to :photo_album

  validates_presence_of :photo_album

  self.per_page = 10

  scope :latest, -> (user = nil, limit = 10) do
    where(photo_album_id: user.photo_albums.map(&:id)).order('created_at desc').limit(limit)
  end

  mount_uploader :file, PhotoUploader

  def truncated_title
    title.present? ? title.truncate(20) : ''
  end
end
