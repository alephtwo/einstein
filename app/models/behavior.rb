class Behavior < ActiveRecord::Base

  belongs_to :client
  has_many :behavior_reports

  validates :description, presence: true

  attr_encryptor :description, key: Rails.application.secrets.behavior_description_key
end
