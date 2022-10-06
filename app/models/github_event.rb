class GithubEvent < ApplicationRecord
  include CreateActivityLog

  belongs_to :user

  after_create :create_activity_log
end
