# Social-Rails is a fork of Socify @sudharti(Sudharsanan Muralidharan)
# Social-Rails is an Open source Social network written in Ruby on Rails.
# @captcussa (Malachai Frazier)
# This file is licensed under GNU GPL v2 or later. See the LICENSE.

class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, only: [:create, :update]
  layout Proc.new { |controller| controller.request.xhr? ? false : 'application' }
  respond_to :html, :js

  def show
    @comments = @post.comments.order('created_at DESC')
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { head :no_content }
        format.js   {}
      end
    end
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to @post
  end

  def destroy
    @post.destroy
    @friends    = current_user.all_following
    @activities = PublicActivity::Activity
                  .where(owner_id: [@friends, current_user])
                  .order(created_at: :desc)
                  .paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
      format.js   {}
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :attachment, :content_html, :user_id)
  end
end
