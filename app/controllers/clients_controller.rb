class ClientsController < ApplicationController

  before_action :set_client, only: [:show, :edit, :update, :destroy, :remove]
  before_filter :check_user

  def index
    @clients = Client.all
    respond_to do | format |
      format.html { @clients = Client.all }
      format.xls { headers["Content-Disposition"] = "attachment; filename=\"clients_#{Time.now.to_i}.xls\""  }
    end
  end

  def show
    respond_to do | format | 
      format.html
      format.xls { headers["Content-Disposition"] = "attachment; filename=\"client_#{@client.id}_#{params[:export] == "behaviors" ? 'behaviors' : 'reports'}_#{Time.now.to_i}.xls\""  }
    end
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

  def remove
    @client.update(:removed => true)

    @client.behaviors.each do | behavior |
      behavior.update(:removed => true)

      behavior.behavior_reports.each do | report | 
        report.update(:removed => true)
      end
    end
    redirect_to clients_path
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

    def client_params
      params.require(:client).permit(:last_name, :password, :password_confirmation)
    end

end
