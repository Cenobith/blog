class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :load_pages

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #def set_locale
  #  I18n.locale = params[:locale] || I18n.default_locale
  #end

  def set_locale
    logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
    I18n.locale = extract_locale_from_accept_language_header
    logger.debug "* Locale set to '#{I18n.locale}'"
  end

  def load_pages
    $pages = Page.all
    $widgets = Widget.all
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

  private
  def extract_locale_from_accept_language_header
    if !request.env['HTTP_ACCEPT_LANGUAGE'].nil?
      request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    else
      return 'en'
    end

  end
end
