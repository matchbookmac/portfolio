class AddGithubUrlToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :github_URL, :string
  end
end
