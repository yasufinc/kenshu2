class MyThreadsController < ApplicationController
  before_action :set_my_thread, only: %i[ show edit update destroy ]

  def index
    @my_threads = MyThread.all
  end

  def show

  end

  def new
    @my_thread = MyThread.new
  end

  def create
    #@my_thread = MyThread.create(my_thread_params)
    #@my_thread = MyThread.new(my_thread_params)
    @my_thread = current_user.my_threads.build(my_thread_params)
    if @my_thread.save
      # flash[:notice] = "新規スレッドが作成されました"
      # redirect_to my_threads_path
      redirect_to my_threads_path, notice: "新規スレッドが作成されました"
    else
      flash.now[:alert] = "失敗しました"
      render :new #new.html.erbに飛んでくれる
    end

  end

  def edit
    user_check
  end

  def update
    if current_user.id == @my_thread.user_id
      if @my_thread.update(my_thread_params)
        redirect_to my_threads_path, notice: 'スレッドが正しく変更されました'
      else
        render 'edit'
      end
    else
      redirect_to my_threads_path and return
    end
  end

  def destroy
    if current_user.id == @my_thread.user_id
      @my_thread.destroy
      redirect_to my_threads_path, notice: 'スレッドが削除されました'
    else
      redirect_to my_threads_path and return
    end
  end



  private
    def set_my_thread
      @my_thread = MyThread.find(params[:id])
    end

    def my_thread_params
      params.require(:my_thread).permit(:title)
    end

    def user_check
      if current_user.id == @my_thread.user_id
        return true
      else
        redirect_to my_threads_path and return
      end
    end

end
