class Users::StepsController < ApplicationController
  def authorization
  end

  def go_to_main
    render "shared/main"
  end

  def list
    params[:head] = "Users list"

    # @users = User.all.order("users.id desc").limit(10).page(params[:page])
    @users = current_user.rule.manager ? User.all.order("users.id desc") : User.where(is_available: true).order("users.id desc")

    render "shared/list"
  end

  def select_language
    params[:locale] = !params[:button].blank? ? params[:button] : params[:locale]
    render "shared/select_language"
  end

  def select_language_session
    params[:locale] = !params[:button].blank? ? params[:button] : params[:locale]
    render "shared/select_language_session"
  end

  def create_user
    params[:head] = "Create user"
    render "shared/create_user"
  end
end
