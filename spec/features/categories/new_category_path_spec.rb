require "rails_helper"

describe "The new category path" do
  it "will let the user add a category" do
    admin = FactoryGirl.create(:admin)
    login_as admin, scope: :user
    visit new_category_path
    fill_in "category_language", with: attributes_for(:category)[:language]
    fill_in "category_description", with: attributes_for(:category)[:description]
    click_on "Create Category"
    expect(page).to have_content("adding")
  end

  it "will return an error if a field is left empty" do
    admin = FactoryGirl.create(:admin)
    login_as admin, scope: :user
    visit new_category_path
    click_on "Create Category"
    expect(page).to have_content("errors")
  end
end
