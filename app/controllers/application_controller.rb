# Application level controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_cond = -> { controller_name == 'sessions' && action_name == 'create' }
  skip_before_filter :verify_authenticity_token, if: skip_cond
  include ClientSessionsHelper

  def after_sign_in_path_for(_resource)
    clients_path
  end

  def log_browser_agent
    browser = Browser.new(ua: request.env['HTTP_USER_AGENT'])
    logger.info("  [BROWSER]  #{browser.name} #{browser.full_version}")
    logger.info("  [PLATFORM] #{browser.platform} #{browser.user_agent}")
  end

  private

  def restrict_to_users
    return if user_signed_in?
    flash[:error] = 'You do not have access to that page.'
    redirect_to root_path
  end

  def restrict_to_clients
    redirect_to login_path unless client_signed_in?
  end
end
