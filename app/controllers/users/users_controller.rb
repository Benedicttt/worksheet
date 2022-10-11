class Users::UsersController < ApplicationController
  def list
    params[:head] = "Users list"
    # @users = User.all.order("users.id desc").limit(10).page(params[:page])
    @users = current_user.rule.manager ? User.all.order("users.id desc") : User.where(is_available: true).order("users.id desc")
  end

  def new
    params[:head] = "New user"
    flash[:alert] = ''
    flash[:success] = ''

    render "users/new"
  end

  def create
    flash[:alert] = ''
    flash[:success] = ''

    user = User.new
    r = Rule.new

    user.first_name = params[:first_name]
    user.last_name = params[:last_name]
    user.email = params[:email]
    user.nickname = params[:nickname]
    user.phone = params[:phone]
    user.telegram = params[:telegram]
    user.password = params[:password]
    user.is_available = params[:is_available]


    if user.valid? && params[:password] == params[:password_confirmation]
      user.save!

      r.user_id = user.id
      r.worker = params[:worker] == "0" ? false : true
      r.manager = params[:manager] == "0" ? false : true
      r.create_user = params[:role_create_user] == "0" ? false : true
      r.edit_user = params[:role_edit_user] == "0" ? false : true
      r.edit_all_work_list = params[:edit_all_work_list] == "0" ? false : true
      r.edit_work_list = params[:edit_work_list] == "0" ? false : true
      r.edit_all_eggs_collection = params[:edit_all_eggs_collection] == "0" ? false : true
      r.edit_eggs_collection = params[:edit_eggs_collection] == "0" ? false : true
      r.save!

      flash[:success] = t('success_create_user')

      # File.open("./app/channels/channel_" + User.last.id.to_s + ".rb", 'w') do |f|
      #   f.puts("
      #     class Channel_" + User.last.id.to_s + " < ApplicationCable::Channel
      #       def subscribed
      #         stream_from self.class
      #       end
      #
      #       def unsubscribed; end
      #     end
      #   ")
      # end

      # @users = User.all.order("users.id desc").limit(10).page(params[:page])
      @users = current_user.rule.manager ? User.all.order("users.id desc") : User.where(is_available: true).order("users.id desc")

      if !current_user.nil?
        render "users/list"
      else
        render "sessions/new_sessions"
      end
    else
      msg = {}
      msg.merge!(password_confirmation: [t('password_match').to_s]) if params[:password] != params[:password_confirmation]
      msg =  user.errors.messages.dup.merge! msg
      flash[:alert] = msg.uniq

      render 'shared/create_user'
    end
  end

  def destroy
    # @users = User.all.order("users.id desc").limit(10).page(params[:page])
    @users = current_user.rule.manager ? User.all.order("users.id desc") : User.where(is_available: true).order("users.id desc")

    User.find(params[:id]).update_attribute(:is_available, false)
    flash[:alert] = "User #{user.first_name} #{user.last_name} set is available FALSE"

    params[:head] = "User #{user.first_name} #{user.last_name} set is available FALSE"

    render 'users/list'
  end

  def edit
    params[:head] = "Edit user #{params[:id]}"
    @user = User.find(params[:id])
    flash[:alert] = ''
    flash[:success] = ''

    render "users/edit"
  end

  def update
    params[:head] = "User #{params[:id]} updated"
    flash[:alert] = ''
    flash[:success] = ''

    begin

      user = User.find(params[:id])
      user.update!(
          id: params[:id],
          first_name: params[:first_name],
          last_name: params[:last_name],
          nickname: params[:nickname],
          email: params[:email],
          phone: params[:phone],
          telegram: params[:telegram],
          is_available: params[:is_available]
      )

      rules = Rule.find_by(user_id: user.id)
      rules.update(
        worker: params[:worker],
        manager: params[:manager],
        create_user: params[:create_user],
        edit_user: params[:edit_user],
        edit_all_work_list: params[:edit_all_work_list],
        edit_work_list: params[:edit_work_list],
        edit_all_eggs_collection: params[:edit_all_eggs_collection],
        edit_eggs_collection: params[:edit_eggs_collection]
      )

      flash[:success] = "User #{user.first_name} #{user.last_name} updated successful"

    rescue
      flash[:alert] = "User not updated"
    end

    # @users = User.all.order("users.id desc").limit(10).page(params[:page])

    @users = current_user.rule.manager ? User.all.order("users.id desc") : User.where(is_available: true).order("users.id desc")

    if current_user.rule.manager
      render "users/list"
    else
      @user = current_user

      flash[:success] = "User #{current_user.first_name} #{current_user.last_name} updated successful"
      render "users/edit"
    end
  end

  def valid_nickname?
    User.where(nickname: params[:nickname]).size == 1 || User.where(nickname: params[:nickname]).size == 0
  end

  def valid_email?
    User.where(email: params[:email]).size == 1 || User.where(email: params[:email]).size == 0
  end
end
