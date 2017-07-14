require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    category_one = Category.create!(title: "Tech")
    category_two = Category.create!(title: "Business")

    visit categories_path

    expect(page).to have_content("Tech")
    expect(page).to have_content("Business")
  end
end
