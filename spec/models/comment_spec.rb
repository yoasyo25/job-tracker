require 'rails_helper'

describe Comment do
  describe "Validations" do
    context "invalid attribute" do
      it "is invalid without a content" do
        comment = Comment.new()
        expect(comment).to_not be_valid
      end
    end

    context "valid attributes" do
      it "is valid with a content" do
        category = Category.create(id: 1, title: "Tech")
        company = Company.create(name: "Turing")
        job = company.jobs.create(id: 1, title: "Developer", level_of_interest: 40,
                                  city: "Denver", category_id: category.id)
        comment = Comment.new(content: "Lots of content", job_id: job.id)
        expect(comment).to be_valid
      end
    end


    describe "relationships" do
      it "belongs to a job" do
        category = Category.create(id: 1, title: "Tech")
        company = Company.create(name: "Turing")
        job = company.jobs.create(id: 1, title: "Developer", level_of_interest: 40,
                                  city: "Denver", category_id: category.id)
        comment = Comment.new(content: "Lots of content", job_id: job.id)
        expect(comment).to respond_to(:job)
      end
    end
  end
end
