class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @tasks = current_user.tasks.order('created_at DESC').page(params[:page])
    @tasks = Task.all.page(params[:page])
    end
  end
end
