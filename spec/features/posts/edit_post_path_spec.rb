require "rails_helper"

describe "The edit post path" do
  it "will let an admin edit a post" do
    admin = create(:admin_with_posts)
    login_as admin, scope: :user
    visit edit_post_path(admin.posts.first)
    fill_in "Content", with: attributes_for(:post)[:content]
    click_on "Update Post"
    expect(page).to have_content("successfully")
  end

  it "will fail to let an admin edit a post if a field is blank" do
    admin = create(:admin_with_posts)
    login_as admin, scope: :user
    visit edit_post_path(admin.posts.first)
    fill_in "Content", with: ""
    click_on "Update Post"
    expect(page).to have_content("error")
  end

  it "will not let an user edit a post" do
    admin = create(:admin_with_posts)
    user = create(:user)
    login_as user, scope: :user
    visit edit_post_path(admin.posts.first)
    expect(page).to have_content("permissions")
  end
end
