class MaintenancesController < ApplicationController
  
  before_filter :check_user

  def index
  end

  def disclaimer
  end

  def clean
    behavior_reports = BehaviorReport.where(:removed => true)
    behaviors = Behavior.where(:removed => true)
    clients = Client.where(:removed => true)

    br_size = behavior_reports.size
    b_size = behaviors.size
    c_size = clients.size

    behavior_reports.each do | report |
      report.destroy
    end
    behaviors.each do | behavior |
      behavior.destroy
    end
    clients.each do | client |
      client.destroy
    end
    flash[:success] = "The database has been cleaned. #{br_size} reports, #{b_size} behaviors, and #{c_size} clients were removed."
    redirect_to clients_path
  end

  private

    def check_user
      unless user_signed_in?
        flash[:alert] = "You do not have access to that action."
        redirect_to root_path
      end
    end

end
