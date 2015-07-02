require "rails_helper"

describe "The new category path" do
  it "will let the user add a category" do
    visit new_category_path
    fill_in "category_language", with: "Ruby"
    fill_in "category_description", with: "I lovely web app framework"
    click_on "Create Category"
    expect(page).to have_content("adding")
  end

  it "will return an error if a field is left empty" do
    visit new_category_path
    click_on "Create Category"
    expect(page).to have_content("errors")
  end
end
