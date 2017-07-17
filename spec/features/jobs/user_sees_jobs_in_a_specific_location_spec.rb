require 'rails_helper'

RSpec.describe "User sees job in a specific location" do
  it "user sees all jobs in Denver" do
    category  = Category.create(title: "Technology")

    company_1 = Company.create(name: "Twitter")
    company_2 = Company.create(name: "GoSpoc")

    job_1     = company_1.jobs.create(title: "Developer", level_of_interest: 55,
                                      city: "Denver", category_id: category.id)

    job_2     = company_1.jobs.create(title: "User Experience", level_of_interest: 15,
                                      city: "Los Angeles", category_id: category.id)

    job_3     = company_2.jobs.create(title: "Accountant", level_of_interest: 50,
                                      city: "Denver", category_id: category.id)

    visit '/jobs?location=Denver'

    expect(page).to have_content("Jobs in Denver")
    expect(page).to have_content("Developer at Twitter")
    expect(page).to have_content("Accountant at GoSpoc")
  end
end
