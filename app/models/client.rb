class Client < ActiveRecord::Base

  has_many :behaviors
  has_many :behavior_reports, :through => :behaviors

  attr_encryptor :last_name, key: Rails.application.secrets.client_last_name_key

  validates :last_name, presence: true
end
