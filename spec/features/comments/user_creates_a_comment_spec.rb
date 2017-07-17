require 'rails_helper'

describe "User can create a comment" do

  it "creates a comment through a link on the job show page" do
    category = Category.create!(title: "Tech")
    company = Company.create!(name: "ESPN")
    job     = company.jobs.create!(title: "Developer",
              description: "Awesomeness",
              level_of_interest: 30,
              city: "Denver",
              category_id: category.id)

    visit company_job_path(company.id, job.id)

    fill_in "comment[content]", with: "First comment"
    click_button "Create Comment"

    fill_in "comment[content]", with: "Second addition"
    click_button "Create Comment"

    fill_in "comment[content]", with: "Third input"
    click_button "Create Comment"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(Comment.count).to eq(3)
    expect(page).to have_content("Third input")
    expect(page).to have_content("Second addition")
    expect(page).to have_content("First comment")
  end
end
