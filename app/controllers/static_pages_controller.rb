class StaticPagesController < ApplicationController
  def home
    @posts = Post.where(published: true).order!(:created_at).paginate(page: params[:page])
  end
end
