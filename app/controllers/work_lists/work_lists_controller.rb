class WorkLists::WorkListsController < ApplicationController
  def new
    render "work_lists/work_list_new"
  end

  def create

  end

  def show
    render "work_lists/show"
  end

  def search
    @work_list = WorkList.find_by(user_id: params[:user_id], month: params[:month], years: params[:year])
    params[:hide] = false
    flash[:warning] = "Work lists not found" if @work_list.nil?

    render "work_lists/show"
  end

  def edit

  end

  def update

  end
end
