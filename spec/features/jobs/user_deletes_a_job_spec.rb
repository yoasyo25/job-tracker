require 'rails_helper'

describe "User deletes an exising job" do
  scenario "a user can delete a job" do
    category = Category.create!(id: 1, title: "Tech")
    company = Company.create(name: "ESPN")
    job     = company.jobs.create(title: "Developer",
                                 description: "Awesomeness",
                                 level_of_interest: 30,
                                 city: "Denver",
                                 category_id: category.id)

    visit company_jobs_path(company.id, job.id)

    within(".job_#{job.id}") do
      click_link "Delete"
    end

    expect(page).to have_content("Developer was successfully deleted!")
  end
end
