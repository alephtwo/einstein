class FilterController < ApplicationController

  def index
    if user_signed_in? && !client_signed_in?
      redirect_to clients_path
    elsif !user_signed_in? && client_signed_in?
      redirect_to new_behavior_report_path
    else  
      redirect_to login_path 
    end
  end

end
