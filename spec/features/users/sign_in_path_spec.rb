require "rails_helper"

describe "The sign in path" do
  it "will let the user sign in" do
    user = create(:user)
    visit new_user_session_path
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_on "Log in"
    expect(page).to have_content("successfully")
  end

  it "will fail to let a user sign in if the form is incorrect" do
    user = create(:user)
    visit new_user_session_path
    fill_in "user_password", with: user.password
    click_on "Log in"
    expect(page).to have_content("Invalid")
  end
end
