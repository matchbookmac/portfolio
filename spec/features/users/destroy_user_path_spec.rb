require "rails_helper"

describe "The destroy user path" do
  it "will let the user delete their account" do
    user = FactoryGirl.create(:user)
    visit user_path(user)
    click_on "Delete Profile"
    expect(page).to have_content("sorry")
  end
end
