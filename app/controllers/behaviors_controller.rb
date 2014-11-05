class BehaviorsController < ApplicationController

  before_action :set_behavior, only: [:edit, :update, :destroy]
  before_filter :check_user

  def index
    @behaviors = Behavior.all
    respond_to do |format|
      format.xls { headers["Content-Disposition"] = "attachment; filename=\"behaviors_#{Time.now.to_i}.xls\"" }
    end
  end

  def create
    @behavior = Behavior.new(behavior_params)
    if @behavior.save
      flash[:success] = "Behavior created successfully."
      redirect_to @behavior.client
    else
      render 'new'
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

  def destroy
    @behavior.destroy
    redirect_to @behavior.client
  end

  private

    def set_behavior
      @behavior = Behavior.find(params[:id])
    end

    def check_user
      unless user_signed_in?
        flash[:alert] = "You do not have access to that page."
        redirect_to root_path
      end
    end

    def behavior_params
      params.require(:behavior).permit(:description, :client_id)
    end

end
