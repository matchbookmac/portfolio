require "rails_helper"

describe "The new comment path" do
  context 'via the html format' do
    it "will let a user create a comment on a post" do
      admin = create(:admin_with_posts)
      user = create(:user)
      login_as user, scope: :user
      visit post_path(admin.posts.first)
      fill_in "post_content", with: attributes_for(:comment)[:content]
      click_on "Comment"
      expect(page).to have_content("successfully")
    end

    it "will fail to let an user create a comment without content" do
      admin = create(:admin_with_posts)
      user = create(:user)
      login_as user, scope: :user
      visit post_path(admin.posts.first)
      click_on "Comment"
      expect(page).to have_content("try again")
    end

    it "will not let an user create a comment without signing in" do
      admin = create(:admin_with_posts)
      visit post_path(admin.posts.first)
      expect(page).to_not have_content("Comment")
    end
  end
  context 'via the js format', js: true do
    it "will let a user create a comment on a post" do
      admin = create(:admin_with_posts)
      user = create(:user)
      login_as user, scope: :user
      visit post_path(admin.posts.first)
      fill_in "post_content", with: attributes_for(:comment)[:content]
      click_on "Comment"
      expect(page).to have_content("successfully")
    end

    it "will fail to let an user create a comment without content" do
      admin = create(:admin_with_posts)
      user = create(:user)
      login_as user, scope: :user
      visit post_path(admin.posts.first)
      click_on "Comment"
      expect(page).to have_content("try again")
    end
  end
end
