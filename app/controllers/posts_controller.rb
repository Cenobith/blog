class PostsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_post, only: [:edit, :update, :destroy, :show]

  def index
    if signed_in?
      @posts = current_user.posts.order!(:created_at)
    else
      @posts = Post.where(published: true).order("created_at DESC")
    end
    if params[:tag]
      @posts = @posts.tagged_with(params[:tag])
    end
    @posts = @posts.paginate(page: params[:page])
  end

  def create
    @posts = current_user.posts.order("created_at DESC").paginate(page: params[:page])
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

  def search
    if signed_in?
      @posts = Post.where("upper(title) LIKE ? or upper(content) LIKE ?", "%"+params[:q].upcase+"%", "%"+params[:q].upcase+"%")
                   .order("created_at DESC")
                   .paginate(page: params[:page])
    else
      @posts = Post.where(published: true)
                   .where("upper(title) LIKE ? or upper(content) LIKE ?", "%"+params[:q].upcase+"%", "%"+params[:q].upcase+"%")
                   .order("created_at DESC")
                   .paginate(page: params[:page])
    end
    if @posts.count == 0
      flash[:warning] = "Nothing found"
    end
    render 'posts/index'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :published, :title_image, :tag_list)
  end
end
