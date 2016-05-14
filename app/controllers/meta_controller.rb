class MetaController < ApplicationController
  def random
    @image = Image.order("RANDOM()").where("id != ?", session[:last_viewed_id] || -1).first

    @last_image = Image.find_by id: session[:last_viewed_id]

    render :show
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
  end

  def create
    @image = Image.create image_params
    @image.save!
    redirect_to root_path
  end

  def destroy
  end

  def leaderboard
    @swag_image      = Image.swaggiest
    @arrogant_image  = Image.arrogantest
  end

  def image_params
    params.require(:image).permit(:image)
  end
end
