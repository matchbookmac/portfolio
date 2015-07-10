require "rails_helper"

describe "The edit project path" do
  it "will let the user update their project" do
    admin = create(:admin_with_projects)
    login_as admin, scope: :user
    visit edit_project_path(admin.projects.first)
    fill_in "project_description", with: "An app to schedule patients in clinical trials"
    click_on "Update Project"
    expect(page).to have_content("updating")
  end

  it "will return an error if a field is left empty" do
    admin = create(:admin_with_projects)
    login_as admin, scope: :user
    visit edit_project_path(admin.projects.first)
    fill_in "project_description", with: ""
    click_on "Update Project"
    expect(page).to have_content("errors")
  end

  it "will fail to let the user edit a project if they are not admin" do
    admin = create(:admin_with_projects)
    user = create(:user)
    login_as user, scope: :user
    visit edit_project_path(admin.projects.first)
    expect(page).to have_content("permissions")
  end
end
