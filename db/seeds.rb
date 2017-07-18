Company.destroy_all
Job.destroy_all
Category.destroy_all

COMPANIES = ["ESPN", "Aetna", "United Airlines", "Denver Public Schools", "Shopify", "Starbucks", "Pivotal Labs", "Captain U"]
JOBS = ["Engineering", "Development", "Dev Ops", "Quality Assurance", "Teacher", "Product Manager", "Consultant", "Community Manager"]
CITIES = ["Seattle", "Denver", "Portland", "Indianapolis", "Madison", "Orlando", "San Diego", "Austin", "Las Vegas", "Little Rock", "Boise", "Eugene", "Oakland"]
CATEGORIES = ["Sales", "Technology", "Health Care", "Education", "Broadcast"]

CATEGORIES.each do |title|
  category = Category.create!(title: title)
  puts "Created #{category.title}"
end

COMPANIES.each do |name|
  company = Company.create!(name: name)
  puts "Created #{company.name}"
end

JOBS.each do |work|
  company = Company.create!(name: "#{work}company")
  category = Category.create!(title: "#{work}category")
  job = Job.create!(title: JOBS.sample, description: "What a great position!",
                         level_of_interest: rand(100), company_id: company.id,
                         city: CITIES.sample, category_id: category.id)
    puts "  Created #{job.title}"
end

User.create(name: "Admin User", email: "example@example.com", password: "asdfasdf",
            password_confirmation: "asdfasdf", roles: "admin_user")
