class ProfilesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_profile, only: [:edit, :update, :show]

  def show
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      flash[:success] = I18n.t('profile_created')
      redirect_to root_path
    else
      render 'static_pages/home'
    end
  end

  def edit
  end

  def show
  end

  def update
    @profile.update(profile_params)
    redirect_to root_path
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:firstname, :lastname, :country, :userpic, :use_gravatar, :nickname)
  end
end
