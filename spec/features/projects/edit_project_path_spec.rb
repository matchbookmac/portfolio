require "rails_helper"

describe "The edit project path" do
  it "will let the user update their project" do
    user = create(:admin_with_projects)
    login_as user, scope: :user
    visit edit_project_path(user.projects.first)
    fill_in "project_description", with: "An app to schedule patients in clinical trials"
    click_on "Update Project"
    expect(page).to have_content("updating")
  end

  it "will return an error if a field is left empty" do
    user = create(:admin_with_projects)
    login_as user, scope: :user
    visit edit_project_path(user.projects.first)
    fill_in "project_description", with: ""
    click_on "Update Project"
    expect(page).to have_content("errors")
  end
end
