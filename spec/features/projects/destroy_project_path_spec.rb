require "rails_helper"

describe "The destroy project path" do
  it "will let the user delete a project" do
    project = Project.create(name: "Clinical Trials", description: "An app to schedule in clinical trials", repo_URL: "https://github.com/alexcaste/clinical_trials")
    visit project_path(project)
    click_on "Delete Project"
    expect(page).to have_content("gone")
  end
end
