class IndexController < ApplicationController
  def index
    redirect_to sessions_new_path if !logged_in?
  end
end
