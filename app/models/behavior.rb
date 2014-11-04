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

  scope :active, -> { where(:is_deleted => false) }
  
end
