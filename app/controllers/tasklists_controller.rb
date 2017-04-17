class TasklistsController < ApplicationController
  
  def index
    @tasklists = Tasklists.all
  end

  def show
    @tasklists = Tasklists.find(params[:id])
  end

  def new
    def new
     @tasklists = Tasklists.new
  end
  end

 def create
    @tasklists = Tasklists.new(tasklists_params)

    if @tasklists.save
      flash[:success] = 'Task が正常に投稿されました'
      redirect_to @tasklists
    else
      flash.now[:danger] = 'Task が投稿されませんでした'
      render :new
    end
  end

   def edit
    @tasklists = Tasklists.find(params[:id])
  end

  def update
    @tasklists = Tasklists.find(params[:id])

    if @tasklists.update(tasklists_params)
      flash[:success] = 'タスク は正常に更新されました'
      redirect_to @message
    else
      flash.now[:danger] = 'タスク は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @tasklists = Tasklists.find(params[:id])
    @tasklists.destroy

    flash[:success] = 'Task は正常に削除されました'
    redirect_to messages_url
  end

  private

  # Strong Parameter
  def message_params
    params.require(:message).permit(:content)
  endend
