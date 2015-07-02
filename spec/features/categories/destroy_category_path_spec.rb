require "rails_helper"

describe "The destroy category path" do
  it "will let the user delete a category" do
    category = Category.create(language: "Ruby", description: "A lovely web app platform")
    visit category_path(category)
    click_on "Delete Category"
    expect(page).to have_content("gone")
  end
end
