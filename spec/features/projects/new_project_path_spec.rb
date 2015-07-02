require "rails_helper"

describe "The new project path" do
  it "will let the user add a project" do
    visit new_project_path
    fill_in "project_name", with: "Clinical Trials"
    fill_in "project_description", with: "An app to schedule clinical trials"
    fill_in "project_URL", with: "http://scheduling-app.herokuapp.com/"
    fill_in "project_repo_URL", with: "https://github.com/alexcaste/clinical_trials"
    click_on "Create Project"
    expect(page).to have_content("adding")
  end

  it "will return an error if a field is left empty" do
    visit new_project_path
    click_on "Create Project"
    expect(page).to have_content("errors")
  end
end
