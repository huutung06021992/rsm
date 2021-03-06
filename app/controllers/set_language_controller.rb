class SetLanguageController < ApplicationController

  def index
    if I18n.available_locales.include? params[:locale].to_sym
      I18n.locale = params[:locale].to_sym
    else
      I18n.locale = :en
    end
    set_session_and_redirect
  end

  private

  def set_session_and_redirect
    session[:locale] = I18n.locale
    redirect_back fallback_location: root_path
    rescue ActionController::RedirectBackError
      redirect_to :root
  end
end
