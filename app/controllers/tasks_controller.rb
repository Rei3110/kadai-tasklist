class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :require_user_logged_in
  
  def index
    @tasks = current_user.tasks.build  # form_for 用
    
  end

  def show
  end

  def new
     @task = Task.new
  end

 def create
    @task = Task.new(task_params)
    @task = current_user.tasks.build(task_params)

    if @task.save
      flash[:success] = 'タスクが正常に追加されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスクが追加されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] = 'タスクは正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスクは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @task.destroy

    flash[:success] = 'タスクは正常に削除されました'
     redirect_back(fallback_location: root_path)
  end

  private

  # Strong Parameter
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
   def set_task
    @task = Task.find(params[:id])
  end
 
 
 def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    unless @micropost
      redirect_to root_path
    end
  end
 
  
  end
