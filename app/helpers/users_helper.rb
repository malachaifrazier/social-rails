# Social-Rails is a fork of Socify @sudharti(Sudharsanan Muralidharan)
# Social-Rails is an Open source Social network written in Ruby on Rails.
# @captcussa (Malachai Frazier)
# This file is licensed under GNU GPL v2 or later. See the LICENSE.

module UsersHelper
  def options_for_seasons
    [['Male', 'male'], ['Female', 'female']]
  end

  def age(dob)
    now = Time.now.utc.to_date
    now.year - dob.year - (dob.to_date.change(:year => now.year) > now ? 1 : 0)
  end

  def is_current_user?(user)
    user == current_user
  end
end
