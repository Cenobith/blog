class StaticPagesController < ApplicationController
  def home
    @posts = Post.where(published: true).order("published_at DESC").paginate(page: params[:page])
  end
end
