class WorkLists::WorkListsController < ApplicationController
  def new
    if params[:month] == "0"
      flash[:alert] = "Please select MONTH"
      render "work_lists/show"
    else
      render "work_lists/work_list_new"
    end
  end

  def create
    condition = WorkList.find_by(day:         params[:day],
                                 month:       params[:month],
                                 years:        params[:year],
                                 user_id:     params[:user_id])
    if condition.nil?
      WorkList.create(
        day:         params[:day],
        month:       params[:month],
        years:        params[:year],
        user_id:     params[:user_id],
        work_start:  "#{params[:work_start_hour]}:#{params[:work_start_min]}",
        work_stop:   "#{params[:work_stop_hour]}:#{params[:work_stop_min]}",
        break_start: "#{params[:break_start_hour]}:#{params[:break_start_min]}",
        break_stop:  "#{params[:break_stop_hour]}:#{params[:break_stop_min]}",
        hours:       params[:common_hours],
        comment:     params[:comment]
      )

      flash[:success] = "Added new data to work day #{params[:day]}.#{params[:month]}.#{params[:year]}"
    else
      condition.update(
        day:         params[:day],
        month:       params[:month],
        years:        params[:year],
        user_id:     params[:user_id],
        work_start:  "#{params[:work_start_hour]}:#{params[:work_start_min]}",
        work_stop:   "#{params[:work_stop_hour]}:#{params[:work_stop_min]}",
        break_start: "#{params[:break_start_hour]}:#{params[:break_start_min]}",
        break_stop:  "#{params[:break_stop_hour]}:#{params[:break_stop_min]}",
        hours:       params[:common_hours],
        comment:     params[:comment]
      )

      flash[:success] = "Updated new data to work day #{params[:day]}.#{params[:month]}.#{params[:year]}"
    end

    render "work_lists/work_list_new"
  end

  def show
    render "work_lists/show"
  end

  def search
    @work_list = if params[:month] == "0" || params[:month].nil?
                   WorkList.where(user_id: params[:user_id], years: params[:year])
                 else
                   WorkList.where(user_id: params[:user_id], month: params[:month], years: params[:year])
                 end

    params[:hide] = false
    flash[:warning] = "Work lists not found" if @work_list.nil?

    render "work_lists/show"
  end

  def edit
    puts "EDIT"
  end

  def update

  end
end
