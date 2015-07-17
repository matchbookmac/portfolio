require "rails_helper"

describe User do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }

  it { should have_and_belong_to_many :categories}
  it { should have_and_belong_to_many :projects}
  it { should have_many :posts }

  it { should have_many :references }
  it { should have_many :users }

  describe "#full_name" do
    it "will return the full name of the profile" do
      user = create(:user)
      expect(user.full_name).to eq "#{user.first_name} #{user.last_name}"
    end
  end

  context "#projects_with_category" do
    it "will return and array of projects for a user that are in a certain category" do
      user = create(:user)
      category_0 = create(:category)
      category_1 = create(:category)
      project_0 = create(:project)
      project_1 = create(:project)
      user.categories.push(category_0)
      project_0.categories.push(category_0)
      user.projects.push(project_0)
      expect(user.projects_with_category(category_0)).to eql [project_0]
    end
  end
end
