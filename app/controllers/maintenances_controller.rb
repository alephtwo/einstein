class MaintenancesController < ApplicationController
  
  before_filter :check_user

  def index
    @maintenances = Maintenance.where(:deleted_user => nil)
    @users = Maintenance.where.not(:deleted_user => nil)
  end

  def disclaimer
    @hidden_clients = Client.where(:removed => true).size
    @hidden_behaviors = Behavior.where(:removed => true).size
    @hidden_reports = BehaviorReport.where(:removed => true).size
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

    maint = current_user.maintenances.build
    maint.reports_deleted = br_size
    maint.behaviors_deleted = b_size
    maint.clients_deleted = c_size
    maint.total_deleted = br_size + b_size + c_size
    maint.save

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
