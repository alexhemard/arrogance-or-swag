class VotesController < ApplicationController
  before_action :set_image, only: [:create]

  def create
    session[:last_viewed_id] = @image.id

    if params[:vote_arrogance]
      session[:last_viewed_vote] = "a"
      @image.vote_arrogance! params[:vote_arrogance]
    elsif params[:vote_swag]
      session[:last_viewed_vote] = "s"
      @image.vote_swag! params[:vote_swag]
    end

    redirect_to root_path
  end

  private

  def set_image
    @image = Image.find(params[:image_id])
  end
end
