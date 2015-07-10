require "rails_helper"

describe "The destroy user path" do
  it "will let the user delete their account" do
    admin = FactoryGirl.create(:admin)
    login_as admin, scope: :user
    visit user_path(admin)
    click_on "Delete Profile"
    expect(page).to have_content("sorry")
  end
end
