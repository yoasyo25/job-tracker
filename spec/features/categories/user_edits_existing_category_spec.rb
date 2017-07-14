require 'rails_helper'

describe "User edits an existing category" do
  scenario "a user can edit a category" do
    category = Category.create!(title: "Administration")

    visit edit_category_path(category)

    fill_in "category[title]", with: "Business Analysis"
    click_button "Update"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content("Business Analysis")
    expect(page).to_not have_content("Administration")
  end
end
