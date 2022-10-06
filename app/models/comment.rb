class Comment < ApplicationRecord
  include CreateActivityLog

  belongs_to :user
  belongs_to :post

  # Validations
  validates :message, presence: true

  after_create :create_activity_log

end
