# Social-Rails is a fork of Socify @sudharti(Sudharsanan Muralidharan)
# Social-Rails is an Open source Social network written in Ruby on Rails.
# @captcussa (Malachai Frazier)
# This file is licensed under GNU GPL v2 or later. See the LICENSE.

class Post < ActiveRecord::Base
  include Shared::Callbacks
  include PublicActivity::Model

  belongs_to :user
  counter_culture :user

  acts_as_votable
  acts_as_commentable

  mount_uploader :attachment, AttachmentUploader

  validates_presence_of :content
  validates_presence_of :user

  tracked only: [:create], owner: proc { |_controller, model| model.user }

  auto_html_for :content do
    image
    youtube(width: 400, height: 250, autoplay: true)
    link target: '_blank', rel: 'nofollow'
    simple_format
  end
end
