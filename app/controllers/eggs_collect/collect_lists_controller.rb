class EggsCollect::CollectListsController < ApplicationController
  def show
    params[:head] = "Eggs collect"

    @eggs = EggCollect.all

    params[:hide] == true

    render "eggs_collect/show", params: params
  end

  def new
    params[:head] = "Eggs collect list"
    puts params.to_json

    if params[:month].empty? || params[:month] == "0"
      flash[:alert] = "Please select MONTH"
      render "eggs_collect/show", params: params
    else
      render "eggs_collect/new", params: params
    end
  end

  def search
    params[:head] = "Eggs collect"

    @eggs = if params[:month].empty? || params[:month] == "0"
                   EggCollect.where(year: params[:year])
                 else
                   EggCollect.where(year: params[:year], month: params[:month])
                 end

    flash[:warning] = "Eggs lists not found" if @eggs.blank?

    params[:hide] = false

    render "eggs_collect/show", params: params
  end



  def create
    param = {
      prima: params[:prima],
      craggs: params[:craggs],
      big_small: "#{params[:big]}+#{params[:small]}",
      flooreggs: params[:flooreggs],
      egg_width: params[:egg_width],
      deads_chick: params[:deads_chicks],
      deads_hen: params[:deads_hens],
      water_ml_day: params[:water_ml_day],
      feed_g_day: params[:feed_g_day],
      hen_width: params[:hen_width],
      day: params[:day],
      month: params[:month],
      year: params[:year],
    }

    EggCollect.create! param if params[:id] == "0"
    EggCollect.update! param if params[:id] != "0"

    render "eggs_collect/new", day: params[:day], month: params[:month]
  end

  def show_pdf

  end

  def show_excel

  end
end
