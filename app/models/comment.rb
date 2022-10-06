class Comment < ApplicationRecord
  include CreateActivityLog

  belongs_to :user
  belongs_to :post

  after_create :create_activity_log

end
