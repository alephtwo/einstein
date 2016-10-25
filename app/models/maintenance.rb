# Maintenance
class Maintenance < ApplicationRecord
  belongs_to :user

  def timestamp
    created_at.to_formatted_s(:long)
  end
end
