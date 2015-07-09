require "rails_helper"

describe "The edit user path" do
  it "will let the user update their user information" do
    user = FactoryGirl.create(:user)
    visit edit_user_path(user)
    fill_in "user_first_name", with: "Ian Charles"
    fill_in "user_bio", with: "I love to code and cook"
    click_on "Update User"
    expect(page).to have_content("updating")
  end

  it "will return an error if a field is left empty" do
    user = FactoryGirl.create(:user)
    visit edit_user_path(user)
    fill_in "user_first_name", with: "Ian Charles"
    fill_in "user_last_name", with: ""
    fill_in "user_bio", with: "I love to code and cook"
    click_on "Update User"
    expect(page).to have_content("errors")
  end
end
