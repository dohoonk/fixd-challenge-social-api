class Post < ApplicationRecord
  include CreateActivityLog

  # Association
  belongs_to :user
  has_many :comments

  after_create :create_activity_log
  
end
