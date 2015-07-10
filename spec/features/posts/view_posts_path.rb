require 'rails_helper'

describe "The viewing posts path" do
  it "will display all posts that are not comments" do
    admin = create(:admin_with_posts)
    user = create(:user_with_comments)
    visit posts_path
    expect(page).to_not have_content("comment")
    expect(page).to have_content("post")
  end
end
