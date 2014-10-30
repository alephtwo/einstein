class Client < ActiveRecord::Base
  attr_encryptor :last_name, key: Rails.application.secrets.client_last_name_key
end
