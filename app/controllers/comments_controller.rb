class CommentsController < ApplicationController
  include ProfilesHelper

  def index

  end

  def new
    @comment = Comment.new
    #render partial: 'form'
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    if signed_in?
      @comment.nickname = nickname_for(current_user)
      @comment.email = current_user.email
    end
    if @comment.save
      flash[:success] = "Comment created"
      Notifier.commented(@comment).deliver
      redirect_to post_path(@comment.post_id)
    else
      render 'static_pages/home'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :nickname, :content, :email)
  end
end
