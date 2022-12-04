class EggsCollect::CountChicksController < ApplicationController
  def set
    if CountChick.where(house:  params[:house], year_start:  params[:year_start], year_end: params[:year_end]).empty?
      cc = CountChick.new
      cc.month_start = params[:month_start]
      cc.year_end = params[:year_end]
      cc.year_start = params[:year_start]
      cc.chicks_start = params[:chicks_start]
      cc.kukko_start = params[:kuko_start]
      cc.house = params[:house]

      cc.save

      flash[:success] = "Create new period"
      render "eggs_collect/show", params: params
    else
      flash[:alert] = "Period already exist"
      render "eggs_collect/show", params: params
    end
  end

  def edit
    cc = CountChick.find(params[:id])

    cc.update!(house: params[:house], year_start:  params[:year_start], year_end: params[:year_end], chicks_start: params[:chicks_start], kukko_start: params[:kuko_start], month_start: params[:month_start])

    flash[:success] = "Period updated"

    render "eggs_collect/show", params: params
  end

  def add_period

  end
end
