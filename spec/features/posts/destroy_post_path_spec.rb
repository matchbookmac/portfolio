require "rails_helper"

describe "The destroy post path" do
  it "will let an admin destroy a post" do
    admin = create(:admin_with_posts)
    login_as admin, scope: :user
    visit post_path(admin.posts.first)
    click_on "Delete"
    expect(page).to have_content "successfully"
  end
end
