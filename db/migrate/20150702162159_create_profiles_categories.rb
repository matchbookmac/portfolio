class CreateProfilesCategories < ActiveRecord::Migration
  def change
    create_table :profiles_categories do |t|
      t.belongs_to :profile, index: true
      t.belongs_to :category, index: true
    end
  end
end
