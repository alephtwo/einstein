# Application level controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ClientSessionsHelper

  def after_sign_in_path_for(_resource)
    clients_path
  end

  def log_browser_agent
    browser = Browser.new(ua: request.env['HTTP_USER_AGENT'])
    logger.info("  [BROWSER]  #{browser.name} #{browser.full_version}")
    logger.info("  [PLATFORM] #{browser.platform} #{browser.user_agent}")
  end

  protected
  def check_user
    return if user_signed_in?
    flash[:error] = 'You do not have access to that action.'
    redirect_to root_path
  end
end
