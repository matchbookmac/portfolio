require "rails_helper"

describe "The edit category path" do
  it "will let the user update their category" do
    category = FactoryGirl.create(:category)
    visit edit_category_path(category)
    fill_in "category_language", with: "JavaScript"
    fill_in "category_description", with: "A lightweight language for the web"
    click_on "Update Category"
    expect(page).to have_content("updating")
  end

  it "will return an error if a field is left empty" do
    category = FactoryGirl.create(:category)
    visit edit_category_path(category)
    fill_in "category_language", with: "JavaScript"
    fill_in "category_description", with: ""
    click_on "Update Category"
    expect(page).to have_content("errors")
  end
end
