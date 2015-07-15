# Behavior Report
class BehaviorReport < ActiveRecord::Base
  belongs_to :behavior

  def timestamp
    created_at.to_formatted_s(:long)
  end

  def updated_timestamp
    updated_at.to_formatted_s(:long)
  end

  scope :active, -> { where(removed: false) }
end
