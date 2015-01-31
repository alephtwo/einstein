class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  paginates_per 10

  attr_encryptor :first_name, key: Rails.application.secrets.user_first_key
  attr_encryptor :last_name, key: Rails.application.secrets.user_last_key

  has_many :clients
  has_many :maintenances

end