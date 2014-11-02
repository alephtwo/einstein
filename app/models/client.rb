class Client < ActiveRecord::Base

  has_many :behaviors
  has_many :behavior_reports, :through => :behaviors

  attr_encryptor :last_name, key: Rails.application.secrets.client_last_name_key

  validates :last_name, presence: true
  has_secure_password
  validates :password_confirmation, presence: true

  before_create :create_remember_token
  
  def Client.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Client.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  # def chronological_behavior_reports
  #   (self.behavior_reports.sort_by &:created_at).reverse
  # end

  private
    def create_remember_token
      self.remember_token = Client.digest(Client.new_remember_token)
    end
  
end
