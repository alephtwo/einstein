# Behaviors Controller
class BehaviorsController < ApplicationController
  before_action :set_behavior, only: [:edit, :update, :destroy, :remove]
  before_action :restrict_to_users

  def index
    @behaviors = Behavior.all
    respond_to do |format|
      format.xlsx do
        time = Time.zone.now.to_i
        render xlsx: 'index', filename: "behaviors_#{time}.xlsx"
      end
    end
  end

  def create
    @behavior = Behavior.new(behavior_params)
    if @behavior.save
      flash[:success] = 'Behavior created successfully.'
    else
      flash[:error] = 'Behaviors must have a description!'
    end
    redirect_to @behavior.client
  end

  def edit
  end

  def update
    if @behavior.update(behavior_params)
      redirect_to @behavior.client, notice: 'Behavior was successfully updated.'
    else
      render :edit
    end
  end

  def remove
    @behavior.update(removed: true)
    @behavior.behavior_reports.each do |report|
      report.update(removed: true)
    end
    redirect_to @behavior.client
  end

  def destroy
    @behavior.destroy
    redirect_to @behavior.client
  end

  private

  def set_behavior
    @behavior = Behavior.find(params[:id])
  end

  def behavior_params
    params.require(:behavior).permit(:description, :client_id)
  end
end
