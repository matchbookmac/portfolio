require "rails_helper"

describe "The new user path" do
  it "will let the user add themselves to the app" do
    visit new_user_path
    fill_in "user_first_name", with: "Ian"
    fill_in "user_last_name", with: "MacDonald"
    fill_in "user_bio", with: "I love to code"
    click_on "Create User"
    expect(page).to have_content("adding")
  end

  it "will return an error if a field is left empty" do
    visit new_user_path
    click_on "Create User"
    expect(page).to have_content("errors")
  end
end
