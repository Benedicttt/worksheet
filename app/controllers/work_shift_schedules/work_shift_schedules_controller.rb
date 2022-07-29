class WorkShiftSchedules::WorkShiftSchedulesController < ApplicationController
  def new
    render "work_shift_schedules/new"
  end

  def create

  end

  def edit

  end

  def show
    render "work_shift_schedules/show"
  end

  def destroy
    render "index/index"
  end
end
