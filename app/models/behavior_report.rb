class BehaviorReport < ActiveRecord::Base

  belongs_to :behavior

  def timestamp
    self.created_at.in_time_zone("Central Time (US & Canada)").to_formatted_s(:long)
  end

  def updated_timestamp
    self.updated_at.in_time_zone("Central Time (US & Canada)").to_formatted_s(:long)
  end

  scope :active, -> { where(:removed => false) }

end
