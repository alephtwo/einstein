class Employee < ActiveRecord::Base
  attr_encryptor :first_name, key: Rails.application.secrets.employee_first_name_key
  attr_encryptor :middle_name, key: Rails.application.secrets.employee_middle_name_key
  attr_encryptor :last_name, key: Rails.application.secrets.employee_last_name_key
  attr_encryptor :username, key: Rails.application.secrets.employee_username_key
end
