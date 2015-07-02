class CreateProfilesProjects < ActiveRecord::Migration
  def change
    create_table :profiles_projects do |t|
      t.belongs_to :profile, index: true
      t.belongs_to :project, index: true
    end
  end
end
