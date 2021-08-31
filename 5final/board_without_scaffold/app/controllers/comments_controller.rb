class CommentsController < ApplicationController
  before_action :set_my_thread
  before_action :set_comment, only: %i[ edit update destroy ]

  def create
    #@my_thread.comments.create(comment_params)
    @comment = current_user.comments.build(body: comment_params[:body], my_thread: @my_thread)
    @comment.save
    # redirect_to my_thread_path(@my_thread) = my_thread_path(@my_thread.id)
    redirect_to @my_thread, notice: '新しいコメントが作成されました'
  end

  def edit
    user_check
  end

  def update
    if current_user.id == @comment.user_id
      if @comment.update(comment_params)
        redirect_to @my_thread, notice: 'コメントが正しく変更されました'
      else
        render 'edit'
      end
    else
      redirect_to @my_thread and return
    end

  end

  def destroy
    if current_user.id == @comment.user_id
      @comment.destroy
      redirect_to @my_thread, notice: 'コメントが削除されました'
    else
      redirect_to @my_thread and return
    end
  end


  private

    def set_my_thread
      @my_thread = MyThread.find(params[:my_thread_id])
    end

    def set_comment
      # @comment = @my_thread.comments.find(params[:id])
      @comment = Comment.find(params[:id])
    end


    def comment_params
      params.require(:comment).permit(:body)
    end

    def user_check
      if current_user.id == @comment.user_id
        return true
      else
        redirect_to @my_thread
      end
    end


end
