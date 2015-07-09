class RenameCategoriesProfilesAsCategoriesUsers < ActiveRecord::Migration
  def change
    rename_table :categories_profiles, :categories_users
  end
end
