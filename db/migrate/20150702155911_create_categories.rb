class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.column :language, :string
      t.column :description, :text

      t.timestamps
    end
  end
end
