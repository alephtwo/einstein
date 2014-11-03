class ClientSessionsController < ApplicationController

  before_action :check_sign_out, only: [:new]

  def new
  end

  def create
    client = Client.find_by_id(params[:client_session][:id])
    if client && client.authenticate(params[:client_session][:password])
      flash[:success] = "Logged in successfully."
      client_sign_in client, params[:client_session][:remember] == '1'
      redirect_to submit_path
    else
      flash.now[:alert] = "Invalid id or password. Please try again."
      render "new"
    end
  end

  def destroy
    client_sign_out
    redirect_to root_url
  end

  private
    def check_sign_out
      if client_signed_in?
        client_sign_out
      end
    end

    def check_user
      unless user_signed_in?
        flash[:alert] = "You do not have access to that page."
        redirect_to root_path
      end
    end
  
end
