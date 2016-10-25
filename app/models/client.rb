# Client
class Client < ApplicationRecord
  has_many :behaviors
  has_many :behavior_reports, through: :behaviors
  belongs_to :user

  attr_encryptor :last_name, key: Rails.application.secrets.client_last_name_key

  validates :last_name, presence: true
  has_secure_password
  validates :password_digest, presence: true

  before_create :create_remember_token

  scope :active, -> { where(removed: false) }

  def timestamp
    created_at.to_formatted_s(:long)
  end

  def updated_timestamp
    updated_at.to_formatted_s(:long)
  end

  private

  def create_remember_token
    Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64.to_s)
  end
end
