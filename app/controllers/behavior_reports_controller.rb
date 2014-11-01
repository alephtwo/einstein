class BehaviorReportsController < ApplicationController

  before_filter :check_client_login, only: [:new, :create]

  def new
    @behavior_report = BehaviorReport.new
  end

  def create
    @behavior_report = BehaviorReport.new(behavior_report_params)
    if @behavior_report.save
      flash[:success] = "Report submitted successfully."
      redirect_to new_behavior_report_path
    else
      flash.now[:alert] = "Report could not be submitted."
      render 'new'
    end
  end

  def index
    @behavior_reports = BehaviorReport.all
  end

  private

    def check_client_login
      unless client_signed_in?
        redirect_to new_client_session_path
      end
    end

    def behavior_report_params
      params.require(:behavior_report).permit(:behavior_id, :occurrences)
    end

end
