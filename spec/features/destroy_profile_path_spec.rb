require "rails_helper"

describe "The destroy profile path" do
  it "will let the user delete their profile" do
    profile = Profile.create(first_name: "Ian", last_name: "MacDonald", bio: "Loves to code")
    visit profile_path(profile)
    click_on "Delete Profile"
    expect(page).to have_content("sorry")
  end
end
