require "rails_helper"

describe "The new project path" do
  it "will let the user add a project" do
    admin = FactoryGirl.create(:admin)
    login_as admin, scope: :user
    visit new_project_path
    fill_in "project_name", with: "Clinical Trials"
    fill_in "project_description", with: "An app to schedule clinical trials"
    fill_in "project_URL", with: "http://scheduling-app.herokuapp.com/"
    fill_in "project_repo_URL", with: "https://github.com/alexcaste/clinical_trials"
    click_on "Create Project"
    expect(page).to have_content("adding")
  end

  it "will return an error if a field is left empty" do
    admin = FactoryGirl.create(:admin)
    login_as admin, scope: :user
    visit new_project_path
    click_on "Create Project"
    expect(page).to have_content("errors")
  end

  it "will fail to let the user create a project if they are not admin" do
    admin = create(:admin_with_projects)
    user = create(:user)
    login_as user, scope: :user
    visit new_project_path
    expect(page).to have_content("permissions")
  end
end
