class SessionsController < ApplicationController
  def new
    flash[:success] = ""
    flash[:alert] = ""

    puts "request.to_s"
    puts  request.user_agent
  end

  def create
    user_email = User.find_by(email: params[:email], password: params[:password])
    user_nick = User.find_by(nickname: params[:nickname], password: params[:password])

    session = if !params[:nickname].blank? && !user_nick.nil?
                log_in user_nick
              elsif !params[:email].blank? && !user_email.nil?
                log_in user_email
              end

    if session
      logger.info session
      # redirect_to root_path

      wl = WorkList.where(user_id: current_user.id).last
      params.merge!(
        user_id: current_user.id,
        month: wl.month,
        year: wl.years,
      )

      params.merge!(head: "New work list for user:  #{current_user.first_name} #{current_user.last_name},  month: #{params[:month]},  year: #{params[:year]}")

      render "work_lists/work_list_new", params: params

    else
      flash[:success] = ""
      flash[:alert] = session.nil? ? t('incorrectly') : ''

      render "sessions/new"
    end
  end

  def destroy
    logger.debug 'destroy'
    log_out
    reset_session

    redirect_to sessions_new_path
  end
end