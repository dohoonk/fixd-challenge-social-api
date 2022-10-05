class CreateGithubEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :github_events do |t|
      t.string :event_type
      t.string :event_id
      t.string :repo_name
      t.datetime :event_created_at
      t.string :status
      t.integer :size
      t.integer :number
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
