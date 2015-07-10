require "rails_helper"

describe "The edit user path" do
  it "will let the user update their user information" do
    user = create(:user)
    login_as user, scope: :user
    visit edit_user_registration_path
    fill_in "user_first_name", with: "Ian Charles"
    fill_in "user_current_password", with: user.password
    click_on "Update"
    expect(page).to have_content("successfully")
  end

  it "will return an error if a field is left empty" do
    user = create(:user)
    login_as user, scope: :user
    visit edit_user_registration_path
    fill_in "user_last_name", with: ""
    click_on "Update"
    expect(page).to have_content("errors")
  end
end
