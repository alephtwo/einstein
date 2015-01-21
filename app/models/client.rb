class Client < ActiveRecord::Base

  has_many :behaviors
  has_many :behavior_reports, :through => :behaviors
  belongs_to :user

  attr_encryptor :last_name, key: Rails.application.secrets.client_last_name_key

  validates :last_name, presence: true
  has_secure_password
  validates :password_digest, presence: true

  before_create :create_remember_token

  scope :active, -> { where(:removed => false) }

  def Client.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Client.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def timestamp
    self.created_at.in_time_zone("Central Time (US & Canada)").to_formatted_s(:long)
  end

  def updated_timestamp
    self.updated_at.in_time_zone("Central Time (US & Canada)").to_formatted_s(:long)
  end

  private
    def create_remember_token
      self.remember_token = Client.digest(Client.new_remember_token)
    end
  
end
