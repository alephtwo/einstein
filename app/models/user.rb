class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  attr_encryptor :first_name, key: Rails.application.secrets.user_first_key
  attr_encryptor :middle_name, key: Rails.application.secrets.user_middle_key
  attr_encryptor :last_name, key: Rails.application.secrets.user_last_key

  has_many :clients

end
