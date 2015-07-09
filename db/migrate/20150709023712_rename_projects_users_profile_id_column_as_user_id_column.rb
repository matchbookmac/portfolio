class RenameProjectsUsersProfileIdColumnAsUserIdColumn < ActiveRecord::Migration
  def change
    rename_column :projects_users, :profile_id, :user_id
  end
end
