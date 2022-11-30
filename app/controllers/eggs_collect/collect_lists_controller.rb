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
      prima: params[:prima].to_i,
      craggs: params[:craggs].to_i,
      big_small: "#{params[:big].to_i}+#{params[:small].to_i}",
      flooreggs: params[:flooreggs].to_i,
      egg_width: params[:egg_width].to_f,
      deads_chick: params[:deads_chicks].to_i,
      deads_hen: params[:deads_hens].to_i,
      comments: params[:comments],
      water_ml_day: params[:water_ml_day].to_i,
      feed_g_day: params[:feed_g_day].to_i,
      hen_width: params[:hen_width].to_i,
      day: params[:day].to_i,
      month: params[:month].to_i,
      year: params[:year].to_i,
    }

    if params[:id].to_i == 0
      EggCollect.create!(param)

      flash[:success] = "Create Success"
    else
      ec = EggCollect.find(params[:id])
      ec.update!(param)

      flash[:success] = "Update Success"
    end

    render "eggs_collect/new", day: params[:day], month: params[:month]
  end

  def show_pdf

  end

  def show_excel

  end
end
