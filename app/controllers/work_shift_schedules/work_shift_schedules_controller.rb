class WorkShiftSchedules::WorkShiftSchedulesController < ApplicationController
  def new
    render "work_shift_schedules/new"
  end

  def create
    begin
      wss = WorkShiftSchedule.new

      date_to   = params[:to].split("-")
      date_from = params[:from].split("-")

      params_period = {
        to: date_to[0],
        from: date_from[0],
        month: date_from[1],
        year: date_from[2],
        week_number: params[:week_number]
      }

      conditions_period = Period.where(params_period)
      period_id = if !conditions_period.empty?
                  conditions_period[0].id
                else
                  per = Period.new(params_period).save!
                  per.id
                end

      //
      wss.id = params[:id]
      wss.user_id = params[:user_id]
      wss.period_id = period_id
      wss.monday = params[:monday]
      wss.monday_hours = params[:monday_hours]
      wss.tuesday = params[:tuesday]
      wss.tuesday_hours = params[:tuesday_hours]
      wss.wednesday = params[:wednesday]
      wss.wednesday_hours = params[:wednesday_hours]
      wss.thursday = params[:thursday]
      wss.thursday_hours = params[:thursday_hours]
      wss.friday = params[:friday]
      wss.friday_hours = params[:friday_hours]
      wss.saturday = params[:saturday]
      wss.saturday_hours = params[:saturday_hours]
      wss.sunday = params[:sunday]
      wss.sunday_hours = params[:sunday_hours]
      wss.save

      u = User.find(params[:user_id])
      name = "#{u.first_name} #{u.last_name}"
      flash['success'] = "New worksheet for user #{name} created"

      rescue  Exception => e
        flash['alert'] = "New worksheet for user #{name} NOT created\n"
        puts "#{e.message}"
      end

      render "work_shift_schedules/new"
  end

  def show
    render "work_shift_schedules/show"
  end

  def update
    # begin
      date_to   = params[:to].split("-")
      date_from = params[:from].split("-")

      params_period = {
        to: date_to[0],
        from: date_from[0],
        month: date_from[1],
        year: date_from[2],
        week_number: params[:week_number]
      }

      conditions_period = Period.where(params_period)
      period_id = if !conditions_period.empty?
                    conditions_period[0].id
                  else
                    p = Period.new(params_period).save!
                    p.id
                  end

      //
    WorkShiftSchedule.update(
      user_id: params[:user_id],
      period_id: period_id,
      monday: params[:monday],
      monday_hours: params[:monday_hours],
      tuesday: params[:tuesday],
      tuesday_hours: params[:tuesday_hours],
      wednesday: params[:wednesday],
      wednesday_hours: params[:wednesday_hours],
      thursday: params[:thursday],
      thursday_hours: params[:thursday_hours],
      friday: params[:friday],
      friday_hours: params[:friday_hours],
      saturday: params[:saturday],
      saturday_hours: params[:saturday_hours],
      sunday: params[:sunday],
      sunday_hours: params[:sunday_hours],
    )

      u = User.find(params[:user_id])
      name = "#{u.first_name} #{u.last_name}"
      flash[:success] = "Update worksheet for user #{name} complete"

    # rescue
    #   flash[:alert] = "Update worksheet for user #{name} complete"
    # end

    render "index/index"
  end

  def destroy
    wss = WorkShiftSchedule.find(params[:id])
    wss.destroy
    flash[:alert] = "Work shift schedule - delete"

    render "index/index"
  end
end
