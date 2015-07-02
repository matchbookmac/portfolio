class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.column :first_name, :string
      t.column :last_name, :string
      t.column :bio, :text

      t.timestamps
    end
  end
end
