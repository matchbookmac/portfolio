require "rails_helper"

describe "The sign out path" do
  it "will let the user sign out" do
    user = create(:user)
    login_as user, scope: :user
    visit root_path
    click_on "Log Out"
    expect(page).to have_content("successfully")
  end
end
