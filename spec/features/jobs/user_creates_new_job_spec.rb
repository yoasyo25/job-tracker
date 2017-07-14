require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    category = Category.create(title: "Engineering")
    category2 = Category.create(title: "Testing")
    company = Company.create!(name: "ESPN")

    visit new_company_job_path(company)

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"
    select "Testing", from: "job_category_id"

    click_button "Create"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
  end

  scenario "user sees a link to create a new category on the new job form" do
    company = Company.create!(name: "BET")

    visit new_company_job_path(company)

    click_link "Create a new category for this job"

    expect(current_path).to eq("/categories/new")
  end
end
