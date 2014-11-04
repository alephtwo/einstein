class ClientsController < ApplicationController

  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_filter :check_user
  before_filter :check_access, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.is_admin
      @clients = Client.all
    else 
      @clients = current_user.clients
    end
  end

  def show
  end

  def new
    @client = Client.new
  end

  def create
    @client = current_user.clients.build(client_params)
    if @client.save
      flash[:success] = "Client created successfully."
      redirect_to @client
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @client.update(client_params)
      redirect_to @client, notice: "Client ##{@client.id} was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @client.behaviors.each do | behavior | 
      behavior.destroy
    end
    @client.destroy
      redirect_to clients_path, notice: "Client ##{@client.id} was successfully deleted."
  end

  private
    def set_client
      @client = Client.find(params[:id])
    end

    def check_user
      unless user_signed_in?
        flash[:alert] = "You do not have access to that page."
        redirect_to root_path
      end
    end

    def check_access
      unless (current_user.clients.include? @client) || (current_user.is_admin)
        flash[:alert] = "You do not have access to that page."
        redirect_to clients_path
      end
    end

    def client_params
      params.require(:client).permit(:last_name, :password, :password_confirmation)
    end

end
