class PostsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_post, only: [:edit, :update, :destroy, :show]

  def index
    if signed_in?
      @posts = current_user.posts.order!(:published_at)
    else
      @posts = Post.where(published: true).order("published_at DESC")
    end
    if params[:tag]
      @posts = @posts.tagged_with(params[:tag])
    end
    @posts = @posts.paginate(page: params[:page])
  end

  def create
    post_create("create")
  end

  def new
    @post = Post.new
  end

  def show
  end

  def edit
  end

  def publish
    post_create("publish")
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
                   .order("published_at DESC")
                   .paginate(page: params[:page])
    else
      @posts = Post.where(published: true)
                   .where("upper(title) LIKE ? or upper(content) LIKE ?", "%"+params[:q].upcase+"%", "%"+params[:q].upcase+"%")
                   .order("published_at DESC")
                   .paginate(page: params[:page])
    end
    if @posts.count == 0
      flash[:warning] = "Nothing found"
    end
    render 'posts/index'
  end

  private

  def set_post
    if signed_in?
      @post = Post.find(params[:id])
    else
      @post = Post.where(published: true).find(params[:id])
    end
  rescue ActiveRecord::RecordNotFound
    flash[:warning] = "Nothing found"
    redirect_to root_path
  end

  def post_params
    params.require(:post).permit(:title, :content, :published, :title_image, :tag_list, :published_at)
  end

  def post_create(mode)
    @posts = current_user.posts.order("published_at DESC").paginate(page: params[:page])
    @post = current_user.posts.build(post_params)
    @post.published = true if mode == "publish"
    if @post.save
      if mode == "publish"
        flash[:success] = "Post published"
      else
        flash[:success] = "Post created"
      end

      redirect_to root_path
    else
      render 'static_pages/home'
    end
  end
end
