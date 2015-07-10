require "rails_helper"

describe "The edit category path" do
  it "will let the user update their category" do
    admin = create(:admin_with_categories)
    login_as admin, scope: :user
    visit edit_category_path(admin.categories.first)
    fill_in "category_language", with: attributes_for(:category)[:language]
    click_on "Update Category"
    expect(page).to have_content("updating")
  end

  it "will return an error if a field is left empty" do
    admin = create(:admin_with_categories)
    login_as admin, scope: :user
    visit edit_category_path(admin.categories.first)
    fill_in "category_description", with: ""
    click_on "Update Category"
    expect(page).to have_content("errors")
  end
end
