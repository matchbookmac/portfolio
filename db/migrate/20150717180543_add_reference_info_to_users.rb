class AddReferenceInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :title, :string
    add_column :users, :company, :string
    add_column :users, :phone, :string
  end
end
