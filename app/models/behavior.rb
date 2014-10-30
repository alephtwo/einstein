class Behavior < ActiveRecord::Base
  attr_encryptor :description, key: Rails.application.secrets.behavior_description_key
end
