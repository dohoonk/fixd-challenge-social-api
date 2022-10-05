class AddAverageRatingToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :average_rating, :decimal, default: 0.0
  end
end
