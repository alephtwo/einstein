# Maintenance
class Maintenance < ActiveRecord::Base
  belongs_to :user

  def timestamp
    created_at.in_time_zone('Central Time (US & Canada)').to_formatted_s(:long)
  end
end
