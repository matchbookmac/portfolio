require "rails_helper"

describe "The destroy project path" do
  it "will let the user delete a project" do
    project = FactoryGirl.create(:project)
    visit project_path(project)
    click_on "Delete Project"
    expect(page).to have_content("gone")
  end
end
