class GithubEvent < ApplicationRecord
  include CreateActivityLog

  # Association
  belongs_to :user

  # Validation
  validates :event_id, uniqueness: { scope: :user_id }
  after_create :create_activity_log
end
