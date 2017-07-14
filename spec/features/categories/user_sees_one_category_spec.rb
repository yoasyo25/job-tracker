require 'rails_helper'

describe "User sees on category" do
  scenario "user sees a category and list of jobs associated with that category" do
    category = Category.create!(title: "Tech")
    company = Company.create!(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver",
                        category_id: category.id)

    visit category_path(category)

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content("Tech")
    expect(page).to have_content("Developer")
  end
end
