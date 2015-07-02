class RemoveProfileIdFromCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :profile_id
  end
end
