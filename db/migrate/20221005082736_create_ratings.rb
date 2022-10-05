class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :rater, null: false
      t.decimal :rating

      t.timestamps
    end
    add_foreign_key :ratings, :users, column: :rater_id
  end
end
