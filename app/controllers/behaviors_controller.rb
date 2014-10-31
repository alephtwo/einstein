class BehaviorsController < ApplicationController

  before_action :set_behavior, only: [:show, :edit, :update, :destroy]

  def index
    @behaviors = Behavior.order(client_id: :asc)
  end

  def show
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

    def behavior_params
      params.require(:behavior).permit(:description, :client_id)
    end

end
