class FilterController < ApplicationController

  def index
    logger.info("[BROWSER]  #{request.env['HTTP_USER_AGENT']}")
    if user_signed_in? && !client_signed_in?
      redirect_to clients_path
    elsif !user_signed_in? && client_signed_in?
      redirect_to new_behavior_report_path
    else  
      redirect_to login_path 
    end
  end

end
