require "rails_helper"

describe "The new user path" do
  it "will let the user add themselves to the app" do
    visit new_user_registration_path
    user_attr = attributes_for(:user)
    fill_in "user_first_name", with: user_attr[:first_name]
    fill_in "user_last_name", with: user_attr[:last_name]
    fill_in "user_email", with: user_attr[:email]
    fill_in "user_password", with: user_attr[:password]
    fill_in "user_password_confirmation", with: user_attr[:password]
    click_on "Sign up"
    expect(page).to have_content("successfully")
  end

  it "will return an error if a field is left empty" do
    visit new_user_registration_path
    click_on "Sign up"
    expect(page).to have_content("blank")
  end
end
