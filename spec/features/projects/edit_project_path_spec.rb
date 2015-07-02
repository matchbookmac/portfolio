require "rails_helper"

describe "The edit project path" do
  it "will let the user update their project" do
    project = Project.create(name: "Clinical Trials", description: "An app to schedule in clinical trials", repo_URL: "https://github.com/alexcaste/clinical_trials")
    visit edit_project_path(project)
    fill_in "project_description", with: "An app to schedule patients in clinical trials"
    click_on "Update Project"
    expect(page).to have_content("updating")
  end

  it "will return an error if a field is left empty" do
    project = Project.create(name: "Clinical Trials", description: "An app to schedule in clinical trials", repo_URL: "https://github.com/alexcaste/clinical_trials")
    visit edit_project_path(project)
    fill_in "project_description", with: ""
    click_on "Update Project"
    expect(page).to have_content("errors")
  end
end
