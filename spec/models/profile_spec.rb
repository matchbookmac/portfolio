require "rails_helper"

describe Profile do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :bio }

  it { should have_and_belong_to_many :categories}
  it { should have_and_belong_to_many :projects}

  describe "#full_name" do
    it "will return the full name of the profile" do
      profile = Profile.create(first_name: "Ian", last_name: "MacDonald", bio: "Loves to code")
      expect(profile.full_name).to eq "Ian MacDonald"
    end
  end

  context "#projects_with_category" do
    it "will return and array of projects for a user that are in a certain category" do
      profile = Profile.create(first_name: "Ian", last_name: "MacDonald", bio: "Loves to code")
      category_0 = Category.create(language: "Ruby", description: "Great")
      category_1 = Category.create(language: "JS", description: "Good")
      project_0 = Project.create(name: "Clinical Trials", description: "An app to schedule in clinical trials", repo_URL: "https://github.com/matchbookmac/clinical_trials")
      project_1 = Project.create(name: "nick CAGE", description: "CaRAZY", repo_URL: "https://github.com/matchbookmac/nick_CAGE")
      profile.categories.push(category_0)
      project_0.categories.push(category_0)
      profile.projects.push(project_0)
      expect(profile.projects_with_category(category_0)).to eql [project_0]
    end
  end
end
