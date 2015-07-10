require "rails_helper"

describe "The destroy project path" do
  it "will let the user delete a project" do
    admin = create(:admin_with_projects)
    login_as admin, scope: :user
    visit project_path(admin.projects.first)
    click_on "Delete #{admin.projects.first.name}"
    expect(page).to have_content("gone")
  end

  it "will fail to let the user destroy a project if they are not admin" do
    admin = create(:admin_with_projects)
    user = create(:user)
    login_as user, scope: :user
    visit project_path(admin.projects.first)
    expect(page).to_not have_content("Delete")
  end
end
