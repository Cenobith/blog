class MediaFilesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :edit, :update, :destroy, :index]
  before_action :set_mediafile, only: [:edit, :update, :destroy, :show]

  def index
    @files = current_user.media_files.paginate(page: params[:page])
  end

  def create
    @file = current_user.media_files.build(file_params)
    if @file.save
      flash[:success] = "File added"
      redirect_to media_files_path
    else
      render 'static_pages/home'
    end
  end

  def new
    @file = MediaFile.new
  end

  def destroy
    @file.destroy
    redirect_to media_files_path
  end

  def update
    @file.update(file_params)
    redirect_to media_file_path(@file.id)
  end

  def edit
  end

  def show
  end

  private

  def set_mediafile
    @file = MediaFile.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:warning] = "Nothing found"
    redirect_to root_path
  end

  def file_params
    params.require(:media_file).permit(:name, :attachment, :user_id)
  end

end
