# Client Sessions Controller
class ClientSessionsController < ApplicationController
  before_action :check_sign_out, only: [:new]
  before_filter :reject_users

  def new
  end

  def create
    client = Client.find_by_id(params[:client_session][:id])
    password = params[:client_session][:password]
    if client && !client.removed && client.authenticate(password)
      flash[:success] = 'Logged in successfully.'
      client_sign_in client, params[:client_session][:remember] == '1'
      redirect_to submit_path
    else
      flash[:error] = 'Invalid Client ID or password. Please try again.'
      redirect_to login_path
    end
  end

  def destroy
    client_sign_out
    redirect_to root_url
  end

  private

  def check_sign_out
    client_sign_out if client_signed_in?
  end

  def reject_users
    return unless user_signed_in?
    flash[:error] = 'Staff must log out before visiting the client login page.'
    redirect_to clients_path
  end
end
