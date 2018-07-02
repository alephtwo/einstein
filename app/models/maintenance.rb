# Maintenance
class Maintenance < ApplicationRecord
  belongs_to :user

  def timestamp
    created_at.to_formatted_s(:long)
  end

  def safe_email
    user ? user.email : ''
  end
end
