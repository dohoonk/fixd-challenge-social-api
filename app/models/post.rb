class Post < ApplicationRecord
  include CreateActivityLog

  # Association
  belongs_to :user
  has_many :comments

  # Validations
  validates :title, presence: true
  validates :body, presence: true
  
  after_create :create_activity_log
  
end
