class AddProfileToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :profile_id, :int
  end
end
