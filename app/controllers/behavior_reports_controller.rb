# Behavior Reports Controller
class BehaviorReportsController < ApplicationController
  before_filter :restrict_to_clients, only: [:new, :create]
  before_filter :restrict_to_users, only: [:destroy, :edit, :update, :remove]
  before_action :set_report, only: [:destroy, :edit, :update, :remove]

  def index
    @behavior_reports = BehaviorReport.all
    respond_to do |format|
      format.xlsx do
        time = Time.zone.now.to_i
        render xlsx: 'index', filename: "behavior_reports_#{time}.xlsx"
      end
    end
  end

  def new
    @behavior_report = BehaviorReport.new
    @behaviors = current_client.behaviors.active
  end

  def create
    @behavior_report = BehaviorReport.new(behavior_report_params)
    if @behavior_report.save
      flash[:success] = 'Report submitted successfully.'
      redirect_to submit_path
    else
      flash.now[:alert] = 'Report could not be submitted.'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @behavior_report.update(behavior_report_params)
      redirect_to @client, notice: 'Behavior report was successfully updated.'
    else
      render :edit
    end
  end

  def remove
    @behavior_report.update(removed: true)
    redirect_to @client
  end

  def destroy
    @behavior_report.destroy
    redirect_to @client
  end

  private

  def set_report
    @behavior_report = BehaviorReport.find(params[:id])
    @client = Client.find(@behavior_report.behavior.client.id)
  end

  def behavior_report_params
    params.require(:behavior_report).permit(:behavior_id, :occurrences)
  end
end
