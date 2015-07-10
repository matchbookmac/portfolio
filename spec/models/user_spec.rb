require "rails_helper"

describe User do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }

  it { should have_and_belong_to_many :categories}
  it { should have_and_belong_to_many :projects}

  describe "#full_name" do
    it "will return the full name of the profile" do
      user = FactoryGirl.create(:user)
      expect(user.full_name).to eq "#{user.first_name} #{user.last_name}"
    end
  end

  context "#projects_with_category" do
    it "will return and array of projects for a user that are in a certain category" do
      user = FactoryGirl.create(:user)
      category_0 = FactoryGirl.create(:category)
      category_1 = FactoryGirl.create(:category, language: "JS", description: "Good")
      project_0 = FactoryGirl.create(:project, name: "Clinical Trials", description: "An app to schedule in clinical trials", repo_URL: "https://github.com/matchbookmac/clinical_trials")
      project_1 = FactoryGirl.create(:project, name: "nick CAGE", description: "CaRAZY", repo_URL: "https://github.com/matchbookmac/nick_CAGE")
      user.categories.push(category_0)
      project_0.categories.push(category_0)
      user.projects.push(project_0)
      expect(user.projects_with_category(category_0)).to eql [project_0]
    end
  end
end
