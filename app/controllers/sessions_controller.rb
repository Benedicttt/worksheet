class SessionsController < ApplicationController
  def new
    flash[:success] = ""
    flash[:alert] = ""
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

      wl = WorkList.where(user_id: current_user.id)

      if wl.empty?
        redirect_to root_path
      else
        params.merge!(
          user_id: current_user.id,
          month: wl.last.month,
          year: wl.last.years,
        )

        params.merge!(head: "New work list for user:  #{current_user.first_name} #{current_user.last_name},  month: #{params[:month]},  year: #{params[:year]}")

        render "work_lists/show_work_list", params: params
      end
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