class ClientsController < ApplicationController

before_action :set_client, only: [:show, :edit, :update, :destroy]

def index
  @clients = Client.all
end

private
  def set_client
    @client = Client.find(params[:id])
  end

end
