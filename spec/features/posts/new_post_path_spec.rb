require "rails_helper"

describe "The new post path" do
  it "will let an admin create a post" do
    admin = create(:admin)
    login_as admin, scope: :user
    visit new_post_path
    fill_in "Title", with: attributes_for(:post)[:title]
    fill_in "Content", with: attributes_for(:post)[:content]
    click_on "Create Post"
    expect(page).to have_content("successfully")
  end

  it "will fail to let an admin create a post without content" do
    admin = create(:admin)
    login_as admin, scope: :user
    visit new_post_path
    click_on "Create Post"
    expect(page).to have_content("error")
  end

  it "will not let an user create a post" do
    user = create(:user)
    login_as user, scope: :user
    visit new_post_path
    expect(page).to have_content("permissions")
  end
end
