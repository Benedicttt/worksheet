class WorkShiftSchedules::WorkShiftSchedulesController < ApplicationController
  def new
    params[:head] = "New WorkSheet"
    render "work_shift_schedules/new"
  end

  def create
    # begin
      wss = WorkShiftSchedule.new

      date_to   = params[:to].split("-")
      date_from = params[:from].split("-")

      date_time       = DateTime.new(date_to[2].to_i,   date_to[1].to_i,   date_to[0].to_i)
      date_time_limit = DateTime.new(date_from[2].to_i, date_from[1].to_i, date_from[0].to_i)


      if (date_time_limit - date_time).to_i != 6

        string = "Your interval more #{(date_time_limit - date_time).to_i} days. The interval between dates must be no more than 7 days"
        flash['alert'] = string
      else

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
                      per = Period.create(params_period)
                      per.id
                    end

          //
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
          wss.save!

          wss_day = WorkShiftScheduleDay.new
          wss_day.work_shift_schedule_id = wss.id

          date_time.step(date_time_limit, 1).each_with_index do |e, index|
            wss_day.monday_number_day    = e.day if index == 0
            wss_day.tuesday_number_day   = e.day if index == 1
            wss_day.wednesday_number_day = e.day if index == 2
            wss_day.thursday_number_day  = e.day if index == 3
            wss_day.friday_number_day    = e.day if index == 4
            wss_day.saturday_number_day  = e.day if index == 5
            wss_day.sunday_number_day    = e.day if index == 6
          end

          wss_day.save!

          u = User.find(params[:user_id])
          name = "#{u.first_name} #{u.last_name}"
          flash['success'] = "New worksheet for user #{name} created"
      end
    # rescue Exception => e
    #   flash['alert'] = "#{e.message}"
    # end

    render "work_shift_schedules/new"
  end

  def show
    params[:head] = "WorkSheet"

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
                    p = Period.create(params_period)
                    p.id
                  end

      //
    wss = WorkShiftSchedule.find(params[:id])
    wss.update(
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
      puts "Update worksheet for user #{name} #{params[:user_id]} complete"
      flash[:success] = "Update worksheet for user #{name} #{params[:user_id]} complete"

    # rescue Exception => e
    #   flash[:alert] = "Update worksheet for user #{name} complete\n #{e.message}"
    # end

    render "index/index"
  end

  def destroy
    # wss = WorkShiftSchedule.find(params[:id])
    # wss.destroy
    # flash[:alert] = "Work shift schedule - delete"

    # render "shared/modal_success"
  end
end
