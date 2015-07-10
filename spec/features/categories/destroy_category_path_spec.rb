require "rails_helper"

describe "The destroy category path" do
  it "will let the user delete a category" do
    admin = create(:admin_with_categories)
    login_as admin, scope: :user
    visit category_path(admin.categories.first)
    click_on "Delete #{admin.categories.first.language}"
    expect(page).to have_content("gone")
  end
end
