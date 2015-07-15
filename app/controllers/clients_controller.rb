# Clients Controller
class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy, :remove]
  before_filter :restrict_to_users

  def index
    @clients = Client.all.active
    respond_to do |format|
      format.html
      format.xlsx do
        time = Time.zone.now.to_i
        render xlsx: 'index', filename: "clients_#{time}.xlsx"
      end
    end
  end

  def show
    respond_to do |format|
      format.html do
        @active_behaviors = @client.behaviors.active
        @active_reports = @client.behavior_reports.active
      end
      format.xlsx do
        time = Time.zone.now.to_i
        render(
          xlsx: 'show',
          filename:
            "client_#{@client.id}_#{params[:export]}_#{time}.xlsx"
        )
      end
    end
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      flash[:success] = 'Client created successfully.'
      redirect_to @client
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @client.update(client_params)
      redirect_to(
        @client,
        notice: "Client ##{@client.id} was successfully updated."
      )
    else
      render :edit
    end
  end

  def remove
    @client.update(removed: true)

    @client.behaviors.each do |behavior|
      behavior.update(removed: true)

      behavior.behavior_reports.each do |report|
        report.update(removed: true)
      end
    end
    redirect_to clients_path
  end

  def destroy
    @client.behaviors.each(&:destroy)
    @client.destroy
    redirect_to(
      clients_path,
      notice: "Client ##{@client.id} was successfully deleted."
    )
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params
      .require(:client)
      .permit(:last_name, :password, :password_confirmation, :user_id)
  end
end
