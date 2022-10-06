class CreateActivityLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :activity_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :subject_id, null: false
      t.string :subject_type, null: false
      t.string :name

      t.timestamps
    end
    add_index :activity_logs, :subject_id
    add_index :activity_logs, :subject_type
  end
end
