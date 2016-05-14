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

    #@swag_image = Image.sorted_by_total_swag.first
    arrogant_sql = "select id from (select vote_arrogance::float/NULLIF(vote_arrogance_count,0) as arrogance_average, id from Images) as sub group by id, arrogance_average order by arrogance_average desc LIMIT 1;"
    arrogant_records_array = ActiveRecord::Base.connection.execute(arrogant_sql)
    arrogant_sql_id = arrogant_records_array.getvalue(0,0)
    @arrogant_image = Image.find_by_id(arrogant_sql_id)

    swag_sql = "select id from (select vote_swag::float/NULLIF(vote_swag_count,0) as swag_average, id from Images) as sub group by id, swag_average order by swag_average desc LIMIT 1;"
    swag_records_array = ActiveRecord::Base.connection.execute(swag_sql)
    swag_sql_id = swag_records_array.getvalue(0,0)
    @swag_image = Image.find_by_id(swag_sql_id)

  end

  def image_params
    params.require(:image).permit(:image)
  end
end
