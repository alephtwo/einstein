# Acts as a filter, passing root requests to where they must go
class FilterController < ApplicationController
  def index
    if user_signed_in? == client_signed_in?
      redirect_to login_path
    elsif client_signed_in?
      redirect_to new_behavior_report_path
    else
      redirect_to clients_path
    end
  end
end
