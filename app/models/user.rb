# User
class User < ApplicationRecord
  devise :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable

  attr_encryptor :first_name,
    key: Rails.application.secrets.user_first_key,
    algorithm: 'aes-256-cbc',
    mode: :single_iv_and_salt,
    insecure_mode: true

  attr_encryptor :last_name,
    key: Rails.application.secrets.user_last_key,
    algorithm: 'aes-256-cbc',
    mode: :single_iv_and_salt,
    insecure_mode: true

  has_many :clients
  has_many :maintenances

  def last_sign_in_central
    last_sign_in_at.to_formatted_s(:long)
  end
end
