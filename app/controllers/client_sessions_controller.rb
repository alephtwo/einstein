class ClientSessionsController < ApplicationController

  before_action :check_sign_out, only: [:new]
  before_filter :check_user

  def new
  end

  def create
    client = Client.find_by_id(params[:client_session][:id])
    if client && !client.removed && client.authenticate(params[:client_session][:password])
      flash[:success] = "Logged in successfully."
      client_sign_in client, params[:client_session][:remember] == '1'
      redirect_to submit_path
    else
      flash[:alert] = "Invalid id or password. Please try again."
      redirect_to login_path
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
      if user_signed_in?
        flash[:alert] = "Staff must first log out before visiting the client login page."
        redirect_to clients_path
      end
    end
  
end
