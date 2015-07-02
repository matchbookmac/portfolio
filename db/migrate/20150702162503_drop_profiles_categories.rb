class DropProfilesCategories < ActiveRecord::Migration
  def change
    drop_table :profiles_categories
  end
end
