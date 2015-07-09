class RenameProfilesAsUsers < ActiveRecord::Migration
  def change
    rename_table :profiles, :users
  end
end
