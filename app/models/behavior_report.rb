# Behavior Report
class BehaviorReport < ActiveRecord::Base
  belongs_to :behavior

  def timestamp
    created_at.in_time_zone('Central Time (US & Canada)').to_formatted_s(:long)
  end

  def updated_timestamp
    updated_at.in_time_zone('Central Time (US & Canada)').to_formatted_s(:long)
  end

  scope :active, -> { where(removed: false) }
end
