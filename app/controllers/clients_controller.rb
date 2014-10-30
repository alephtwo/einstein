class ClientsController < ApplicationController

before_action :set_client, only: [:show, :edit, :update, :destroy]

def index
  @clients = Client.all
end

def new
  @client = Client.new
end

def create
  @client = Client.new(client_params)

end

  private
    def set_client
      @client = Client.find(params[:id])
    end

    def item_params
      params.require(:client).permit(:last_name)
    end

end
