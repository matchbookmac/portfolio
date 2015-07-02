class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.column :name, :string
      t.column :description, :string
      t.column :repo_URL, :string
      t.column :URL, :string

      t.timestamps
    end
  end
end
