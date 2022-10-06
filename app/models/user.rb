class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Association
  has_many :posts
  has_many :comments
  has_many :rating
  has_many :rating_raters, class_name: 'Rating', foreign_key: 'rater_id'
  has_many :github_events
  has_many :activity_logs

end
