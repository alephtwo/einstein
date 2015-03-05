class FilterController < ApplicationController

  def index
    browser = Browser.new(ua: request.env['HTTP_USER_AGENT'])
    logger.info("[BROWSER] #{browser.name} #{browser.full_version} on #{browser.platform} (#{browser.user_agent})")
    if user_signed_in? && !client_signed_in?
      redirect_to clients_path
    elsif !user_signed_in? && client_signed_in?
      redirect_to new_behavior_report_path
    else  
      redirect_to login_path 
    end
  end

end
