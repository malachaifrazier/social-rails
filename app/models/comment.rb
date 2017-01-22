# Social-Rails is a fork of Socify @sudharti(Sudharsanan Muralidharan)
# Social-Rails is an Open source Social network written in Ruby on Rails.
# @captcussa (Malachai Frazier)
# This file is licensed under GNU GPL v2 or later. See the LICENSE.

class Comment < ActiveRecord::Base
  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  # acts_as_voteable
  include Shared::Callbacks
  include ActsAsCommentable::Comment
  include PublicActivity::Model

  belongs_to :user
  belongs_to :commentable, polymorphic: true, counter_cache: true

  validates_presence_of :comment
  validates_presence_of :commentable
  validates_presence_of :user

  tracked only: [:create], owner: proc { |_controller, model| model.user }

  # DEPRECATION WARNING: #table_exists? currently checks both tables and views.
  # This behavior is deprecated and will be changed with Rails 5.1 to only
  # check tables. Use #data_source_exists? instead.
  auto_html_for :comment do
    image
    youtube(width: 400, height: 250, autoplay: true)
    link target: '_blank', rel: 'nofollow'
    simple_format
  end

end
