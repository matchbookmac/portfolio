class RenameProfilesProjectsAsProjectsUsers < ActiveRecord::Migration
  def change
    rename_table :profiles_projects, :projects_users
  end
end
