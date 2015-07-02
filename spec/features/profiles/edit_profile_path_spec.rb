require "rails_helper"

describe "The edit profile path" do
  it "will let the user update their profile" do
    profile = Profile.create(first_name: "Ian", last_name: "MacDonald", bio: "Loves to code")
    visit edit_profile_path(profile)
    fill_in "profile_first_name", with: "Ian Charles"
    fill_in "profile_bio", with: "I love to code and cook"
    click_on "Update Profile"
    expect(page).to have_content("updating")
  end

  it "will return an error if a field is left empty" do
    profile = Profile.create(first_name: "Ian", last_name: "MacDonald", bio: "Loves to code")
    visit edit_profile_path(profile)
    fill_in "profile_first_name", with: "Ian Charles"
    fill_in "profile_last_name", with: ""
    fill_in "profile_bio", with: "I love to code and cook"
    click_on "Update Profile"
    expect(page).to have_content("errors")
  end
end
