require 'rails_helper'

describe "User sees one company" do
  scenario "a user sees a company" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Tech")
    company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver",
                        category_id: category.id)

    visit company_path(company)

    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
  end
end

describe "User sees a form to enter contact information on company page" do
  scenario "user can see contact information form and input data" do
    company = Company.create!(name: "ESPN")

    visit company_path(company)

    fill_in "contact[full_name]", with: "Penelope Santorini"
    fill_in "contact[position]", with: "Hiring Manager"
    fill_in "contact[email]", with: "psantorini@example.com"

    click_button "Create Contact"

    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(page).to have_content("Penelope Santorini")
    expect(page).to have_content("Hiring Manager")
    expect(page).to have_content("psantorini@example.com")
  end
end
