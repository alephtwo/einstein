# Behaviors
class Behavior < ApplicationRecord
  belongs_to :client
  has_many :behavior_reports
  validates :description, presence: true

  attr_encryptor :description,
                 key: Rails.application.secrets.behavior_description_key,
                 algorithm: 'aes-256-cbc',
                 mode: :single_iv_and_salt,
                 insecure_mode: true

  def report_count
    behavior_reports.size
  end

  def occurrence_count
    behavior_reports.collect(&:occurrences).sum
  end

  def timestamp
    created_at.to_formatted_s(:long)
  end

  def updated_timestamp
    updated_at.to_formatted_s(:long)
  end

  scope :active, -> { where(removed: false) }
end
