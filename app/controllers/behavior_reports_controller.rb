class BehaviorReportsController < ApplicationController

  before_filter :check_client_login, only: [:new, :create]
  before_filter :check_user, only: [:destroy, :edit, :update, :remove]
  before_action :set_report, only: [:destroy, :edit, :update, :remove]

  def index
    @behavior_reports = BehaviorReport.all
    respond_to do |format|
      format.xlsx { render xlsx: "index", filename: "behavior_reports_#{Time.now.to_i}.xlsx"  }
    end
  end

  def new
    @behavior_report = BehaviorReport.new
  end

  def create
    @behavior_report = BehaviorReport.new(behavior_report_params)
    if @behavior_report.save
      flash[:success] = "Report submitted successfully."
      redirect_to submit_path
    else
      flash.now[:alert] = "Report could not be submitted."
      render 'new'
    end
  end

  def edit
  end

  def update
    if @behavior_report.update(behavior_report_params)
      redirect_to @behavior_report.behavior.client, notice: "Behavior report was successfully updated."
    else
      render :edit
    end
  end

  def remove
    @behavior_report.update(:removed => "true")
    redirect_to @behavior_report.behavior.client
  end

  def destroy
    client = @behavior_report.behavior.client
    @behavior_report.destroy
    redirect_to client
  end

  private

    def check_client_login
      if !client_signed_in?
        if user_signed_in?
          redirect_to users_path
        else
          redirect_to login_path
        end
      end
    end

    def check_user
      unless user_signed_in?
        flash[:alert] = "You do not have access to that page."
        redirect_to root_path
      end
    end

    def set_report
      @behavior_report = BehaviorReport.find(params[:id])
    end

    def behavior_report_params
      params.require(:behavior_report).permit(:behavior_id, :occurrences)
    end

end
