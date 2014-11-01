module ClientSessionsHelper

  def client_sign_in(client, forever = true)
    remember_token = Client.new_remember_token

    if forever 
      cookies.permanent[:remember_token] = remember_token
    else 
      cookies[:remember_token] = remember_token
    end
    client.update_attribute(:remember_token, Client.digest(remember_token))
    self.current_client = client
  end

  def client_sign_out
    current_client.update_attribute(:remember_token,
                                  Client.digest(Client.new_remember_token))
    cookies.delete(:remember_token)
    self.current_client = nil
  end

  def current_client=(client)
    @current_client = client
  end

  def current_client
    remember_token = Client.digest(cookies[:remember_token])
    @current_client ||= Client.find_by(remember_token: remember_token)
  end

  def client_signed_in?
    !current_client.nil?
  end


end
