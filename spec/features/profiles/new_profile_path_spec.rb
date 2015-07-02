require "rails_helper"

describe "The new profile path" do
  it "will let the user add their profile" do
    visit new_profile_path
    fill_in "profile_first_name", with: "Ian"
    fill_in "profile_last_name", with: "MacDonald"
    fill_in "profile_bio", with: "I love to code"
    click_on "Create Profile"
    expect(page).to have_content("adding")
  end

  it "will return an error if a field is left empty" do
    visit new_profile_path
    click_on "Create Profile"
    expect(page).to have_content("errors")
  end
end
