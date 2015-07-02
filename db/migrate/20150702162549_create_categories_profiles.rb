class CreateCategoriesProfiles < ActiveRecord::Migration
  def change
    create_table :categories_profiles do |t|
      t.belongs_to :profile, index: true
      t.belongs_to :category, index: true
    end
  end
end
