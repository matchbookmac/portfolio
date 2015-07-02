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
      
    end
  end
end
