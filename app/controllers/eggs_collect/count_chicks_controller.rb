class EggsCollect::CountChicksController < ApplicationController
  def set
    if CountChick.where(house:  params[:house], date_start:  params[:date_start], date_end: params[:date_end]).empty?
      cc = CountChick.new
      cc.date_end = params[:date_end]
      cc.date_start = params[:date_start]
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

    cc.update!(house: params[:house],
               date_start:  params[:date_start],
               date_end: params[:date_end],
               chicks_start: params[:chicks_start],
               kukko_start: params[:kuko_start]
    )

    flash[:success] = "Period updated"

    render "eggs_collect/show", params: params
  end

  def destroy
    CountChick.find(params[:id]).destroy!
    flash[:success] = "Period deleted"

    render "eggs_collect/show", params: params
  end

  def add_period
    ec = EggCollect.where(house: params[:house], month: params[:month], year: params[:year])
    ec.each do |e|
      e.update(period: params[:period], house: CountChick.find(params[:period]).house)
    end

    flash[:success] = "Update period in all days"
    render "eggs_collect/show", params: params
  end
end
