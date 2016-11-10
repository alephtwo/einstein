# Client Sessions Helper
module ClientSessionsHelper
  attr_writer :current_client

  def client_sign_in(client, forever = true)
    remember_token = SecureRandom.urlsafe_base64

    if forever
      cookies.permanent[:remember_token] = remember_token
    else
      cookies[:remember_token] = remember_token
    end
    client.update_attribute(
      :remember_token,
      Digest::SHA256.hexdigest(remember_token.to_s)
    )
    self.current_client = client
  end

  def client_sign_out
    current_client.update_attribute(
      :remember_token,
      Digest::SHA256.hexdigest(SecureRandom.urlsafe_base64.to_s)
    )
    cookies.delete(:remember_token)
    self.current_client = nil
  end

  def current_client
    remember_token = Digest::SHA256.hexdigest(cookies[:remember_token].to_s)
    @current_client ||= Client.find_by(remember_token: remember_token)
  end

  def client_signed_in?
    !current_client.nil?
  end
end
