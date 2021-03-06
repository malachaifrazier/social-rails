# Social-Rails is a fork of Socify @sudharti(Sudharsanan Muralidharan)
# Social-Rails is an Open source Social network written in Ruby on Rails.
# @captcussa (Malachai Frazier)
# This file is licensed under GNU GPL v2 or later. See the LICENSE.

class LikesController < ApplicationController
  before_action :find_likeable
  before_action :authenticate_user!
  respond_to :js

  def create
    @likeable.liked_by current_user
  end

  def destroy
    @likeable.disliked_by current_user
  end

  private

  def find_likeable
    @likeable_type = params[:likeable_type].classify
    @likeable = @likeable_type.constantize.find(params[:likeable_id])
  end
end
