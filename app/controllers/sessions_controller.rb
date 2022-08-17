class SessionsController < ApplicationController
  def new
    flash[:success] = ""
    flash[:alert] = ""
  end

  def create
    user_email = User.find_by(email: params[:session][:email], password: params[:session][:password])
    user_nick = User.find_by(nickname: params[:session][:nickname], password: params[:session][:password])

    session = if !params[:session][:nickname].blank? && !user_nick.nil?
                log_in user_nick
              elsif !params[:session][:email].blank? && !user_email.nil?
                log_in user_email
              end

    if session
      logger.info session
      redirect_to root_path

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