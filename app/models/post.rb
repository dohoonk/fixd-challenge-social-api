class Post < ApplicationRecord
  # Association
  belongs_to :user
  has_many :comments
end
