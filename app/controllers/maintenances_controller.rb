# Maintenances Controller
class MaintenancesController < ApplicationController
  before_filter :restrict_to_users

  def index
    @maintenances = Maintenance.where(deleted_user: nil)
    @users = Maintenance.where.not(deleted_user: nil)
  end

  def disclaimer
    @hidden_clients = Client.where(removed: true).size
    @hidden_behaviors = Behavior.where(removed: true).size
    @hidden_reports = BehaviorReport.where(removed: true).size
  end

  def clean
    behavior_reports = BehaviorReport.where(removed: true)
    behaviors = Behavior.where(removed: true)
    clients = Client.where(removed: true)

    behavior_reports.each(&:destroy)
    behaviors.each(&:destroy)
    clients.each(&:destroy)

    current_user.maintenances.build(
      reports_deleted: behavior_reports.size,
      behaviors_deleted: behaviors.size,
      clients_deleted: clients.size,
      total_deleted: behavior_reports.size + behaviors.size + clients.size
    ).save

    flash[:success] = 'The database has been cleaned. This has been logged.'
    redirect_to maintenances_path
  end
end
