# Application level controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, if: :skip_filter?
  include ClientSessionsHelper

  def after_sign_in_path_for(_resource)
    clients_path
  end

  private

  def restrict_to_users
    return if user_signed_in?
    flash[:error] = 'You do not have access to that page.'
    redirect_to root_path
  end

  def restrict_to_clients
    redirect_to login_path unless client_signed_in?
  end

  def skip_filter?
    controller_name == 'sessions' && action_name == 'create' ||
      controller_name == 'passwords' && action_name == 'update'
  end
end
