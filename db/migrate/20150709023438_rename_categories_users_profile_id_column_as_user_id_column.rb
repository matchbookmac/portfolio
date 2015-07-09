class RenameCategoriesUsersProfileIdColumnAsUserIdColumn < ActiveRecord::Migration
  def change
    rename_column :categories_users, :profile_id, :user_id
  end
end
