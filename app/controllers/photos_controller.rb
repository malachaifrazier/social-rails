# Social-Rails is a fork of Socify @sudharti(Sudharsanan Muralidharan)
# Social-Rails is an Open source Social network written in Ruby on Rails.
# @captcussa (Malachai Frazier)
# This file is licensed under GNU GPL v2 or later. See the LICENSE.

class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_photo, except: :create
  respond_to :js

  def create
    @photo = Photo.new(
      file: params[:file],
      title: params[:file].original_filename.split('.').first,
      photo_album_id: params[:photo_album_id]
    )
    @photo_album = PhotoAlbum.find(params[:photo_album_id])

    respond_to do |format|
      if @photo.save
        @photo_album.update!(front_image_url: @photo.file.thumb.url) if @photo_album.front_image_url.nil?
        format.json { render json: @photo }
      else
        format.json do
          render json: {
            error: @photo.errors.full_messages.first
          }, status: :unprocessable_entity
        end
      end
    end
  end

  def update
    # @photo.update(params.except(:action, :controller, :commit, 'success_action_status', 'utf8', 'X-Requested-With'))
    respond_to do |format|
      if @photo.update_attributes(photo_params)
        format.html { redirect_to :back, status: 301, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @photo_album = @photo.photo_album
    @photo.destroy
    if @photo_album.photos_count == 1
      @photo_album.update!(front_image_url: nil)
    else
      @photo_album.update!(front_image_url: @photo_album.photos.first.file.thumb.url)
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:id, :file, :title, :photo_album_id)
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end
end
