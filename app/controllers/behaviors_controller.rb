class BehaviorsController < ApplicationController

  before_action :set_behavior, only: [:edit, :update, :destroy, :remove]
  before_filter :check_user

  def index
    @behaviors = Behavior.all
    respond_to do |format|
      format.xlsx { render xlsx: "index", filename: "behaviors_#{Time.now.to_i}.xlsx"  }
    end
  end

  def create
    @behavior = Behavior.new(behavior_params)
    if @behavior.save
      flash[:success] = "Behavior created successfully."
      redirect_to @behavior.client
    else
      flash[:error] = "Behaviors must have a description!"
      redirect_to @behavior.client
    end
  end

  def edit
  end

  def update
    if @behavior.update(behavior_params)
      redirect_to @behavior.client, notice: "Behavior was successfully updated."
    else
      render :edit
    end
  end

  def remove
    @behavior.update(:removed => "true")
    @behavior.behavior_reports.each do | report |
      report.update(:removed => "true")
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
