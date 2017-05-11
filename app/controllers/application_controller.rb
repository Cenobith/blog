class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :load_pages

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def load_pages
    $pages = Page.where(enabled: true)
    $widgets = Widget.where(enabled: true).order(:order)
  end

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User)
      if current_user.profile.nil?
        new_profile_path
      else
        super
      end
    else
      super
    end
  end

  def set_locale
    I18n.locale = http_accept_language.compatible_language_from(I18n.available_locales)
  end
end
