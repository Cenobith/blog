class PostsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_post, only: [:edit, :update, :destroy, :show]

  def index
    @posts = current_user.posts.order(:created_at).paginate(page: params[:page])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created"
      redirect_to root_path
    else
      render 'static_pages/home'
    end
  end

  def new
    @post = Post.new
  end

  def show
  end

  def edit
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  def update
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
