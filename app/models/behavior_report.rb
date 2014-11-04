class BehaviorReport < ActiveRecord::Base

  belongs_to :behavior

  def timestamp
    self.created_at.in_time_zone("Central Time (US & Canada)").to_formatted_s(:long)
  end

  scope :active, -> { where(:is_deleted => false) }

end
