require "rails_helper"

describe "The destroy category path" do
  it "will let the user delete a category" do
    admin = create(:admin_with_categories)
    login_as admin, scope: :user
    visit category_path(admin.categories.first)
    click_on "Delete #{admin.categories.first.language}"
    expect(page).to have_content("gone")
  end

  it "will fail to let the user delete a category if they are not admin" do
    admin = create(:admin_with_categories)
    user = create(:user)
    login_as user, scope: :user
    visit category_path(admin.categories.first)
    expect(page).to_not have_content("Delete")
  end
end
