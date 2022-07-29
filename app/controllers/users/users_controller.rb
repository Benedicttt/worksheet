class Users::UsersController < ApplicationController
  def list
    @users = User.all.order("users.id desc").limit(10).page(params[:page])
  end

  def new
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

      File.open("./app/channels/channel_" + User.last.id.to_s + ".rb", 'w') do |f|
        f.puts("
          class Channel_" + User.last.id.to_s + " < ApplicationCable::Channel
            def subscribed
              stream_from self.class
            end

            def unsubscribed; end
          end
        ")
      end

      @users = User.all.order("users.id desc").limit(10).page(params[:page])

      render "users/list"
    else
      msg = {}
      msg.merge!(password_confirmation: [t('password_match').to_s]) if params[:password] != params[:password_confirmation]
      msg =  user.errors.messages.dup.merge! msg
      flash[:alert] = msg.uniq

      puts "flash[:alert]"
      puts "#{msg}"

      render 'shared/create_user'
    end
  end

  def destroy
    @users = User.all.order("users.id desc").limit(10).page(params[:page])
    User.find(params[:id]).destroy

    begin
      File.delete("./app/channels/channel_" + params[:id].to_s + ".rb")
    rescue
      logger.error 'Ошибка удаления файла'
      flash[:alert] = { msg: 'Ошибка удаления файла, файла не существует' }
    end

    render 'users/list'
  end

  def edit
    @user = User.find(params[:id])
    flash[:alert] = ''
    flash[:success] = ''

    render "users/edit"
  end

  def update
    @user = User.find(params[:id])
    flash[:alert] = ''
    flash[:success] = ''

    logger.debug valid_nickname?
    logger.debug valid_email?
    if valid_nickname? && valid_email?
      user = User.find(params['id'])
      user.update_attribute('first_name', params['first_name'])
      user.update_attribute('last_name', params['last_name'])
      user.update_attribute('nickname', params['nickname'])
      user.update_attribute('email', params['email'])

      flash[:success] = "Пользователь Отредактирован успешно"

    else
      flash[:alert] = { msg: ['Логин или АД уже есть в системе'] }
    end

    render "users/list"
  end

  def valid_nickname?
    User.where(nickname: params[:nickname]).size == 1 || User.where(nickname: params[:nickname]).size == 0
  end

  def valid_email?
    User.where(email: params[:email]).size == 1 || User.where(email: params[:email]).size == 0
  end
end
