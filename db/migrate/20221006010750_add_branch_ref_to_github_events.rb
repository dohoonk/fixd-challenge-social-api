class AddBranchRefToGithubEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :github_events, :branch_ref, :string
  end
end
