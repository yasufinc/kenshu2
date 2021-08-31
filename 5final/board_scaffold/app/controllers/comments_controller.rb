class CommentsController < ApplicationController

  before_action :set_my_thread

  def create
    #@my_thread = MyThread.find(params[:my_thread_id])
    @my_thread.comments.create(comment_params)
    redirect_to my_thread_path(@my_thread)
  end

  def edit
    #binding.pry
    #@my_thread = MyThread.find(params[:my_thread_id])
    @comment = Comment.find(params[:id])
  end

  def update
    #@my_thread = MyThread.find(params[:my_thread_id])
    @comment = @my_thread.comments.find(params[:id])
    #@comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      #redirect_to my_thread_path
      redirect_to my_thread_path(@my_thread)
    else
      render 'edit'
    end

  end


  def destroy
    #@my_thread = MyThread.find(params[:my_thread_id])
    @comment = @my_thread.comments.find(params[:id])
    @comment.destroy
    redirect_to my_thread_path(@my_thread)
  end


  private
    def set_my_thread
      @my_thread = MyThread.find(params[:my_thread_id])
    end
    def set_comment
      @comment = Comment.find(params[:id])
    end
    def comment_params
      params.require(:comment).permit(:body)
    end


end
