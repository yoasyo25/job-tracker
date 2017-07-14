require 'rails_helper'

describe "User edits an existing job" do
  scenario "a user can edit a job" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Tech")
    job     = company.jobs.create!(title: "Developer",
                                  description: "Awesomeness",
                                  level_of_interest: 30,
                                  city: "Denver",
                                  category_id: category.id)

    visit edit_company_job_path(company, job)

    fill_in "job[description]",       with: "More Awesomeness"
    fill_in "job[level_of_interest]", with: 90

    click_button "Update Job"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(page).to have_content("More Awesomeness")
    expect(page).to have_content(90)
  end
end
