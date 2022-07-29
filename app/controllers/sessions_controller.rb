class SessionsController < ApplicationController
  def new
    flash[:success] = ""
    flash[:alert] = ""
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    user_ad = User.find_by(nickname: params[:session][:nickname])

    session = if user && User.where(:password => params[:session][:password]).first
                log_in user
              elsif user_ad && User.where(:password => params[:session][:password]).first
                log_in user_ad
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