# Social-Rails is a fork of Socify @sudharti(Sudharsanan Muralidharan)
# Social-Rails is an Open source Social network written in Ruby on Rails.
# @captcussa (Malachai Frazier)
# This file is licensed under GNU GPL v2 or later. See the LICENSE.
#
class Authentication < ActiveRecord::Base
  validates_presence_of :user
  belongs_to :user

  def self.from_omniauth(auth, user)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |authentication|
      authentication.provider    = auth.provider
      authentication.uid         = auth.uid
      authentication.oauth_token = auth.credentials.token
      authentication.user        = user
    end
  end

end
