class Users::StepsController < ApplicationController
  def authorization
  end

  def go_to_main
    render "shared/main"
  end

  def list
    # @users = User.all.order("users.id desc").limit(10).page(params[:page])
    @users = current_user.rule.manager ? User.all.order("users.id desc") : User.where(is_available: true).order("users.id desc")

    render "shared/list"
  end

  def select_language
    render "shared/select_language"
  end

  def create_user
    render "shared/create_user"
  end
end
