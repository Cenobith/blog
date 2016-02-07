class StaticPagesController < ApplicationController
  def home
    @posts = Post.all.order(:created_at).paginate(page: params[:page])
  end
end
