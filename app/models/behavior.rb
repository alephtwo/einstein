class Behavior < ActiveRecord::Base

  belongs_to :client
  has_many :behavior_reports

  validates :description, presence: true

  attr_encryptor :description, key: Rails.application.secrets.behavior_description_key

  def report_count
    self.behavior_reports.size
  end

  def occurrence_count
    self.behavior_reports.collect { | x | x.occurrences }.sum
  end

  def timestamp
    self.created_at.in_time_zone("Central Time (US & Canada)").to_formatted_s(:long)
  end

  def updated_timestamp
    self.updated_at.in_time_zone("Central Time (US & Canada)").to_formatted_s(:long)
  end

  scope :active, -> { where(:removed => false) }
  
end
