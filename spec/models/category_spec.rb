require 'rails_helper'

describe Category do
  describe "Validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        category = Category.new()
        expect(category).to_not be_valid
      end
    end

    it "has a unique title" do
      Category.create(title: "Administration")
      category = Category.new(title: "Administration")
      expect(category).to be_invalid
    end
  end

  context "valid attributes" do
    it "is valid with a title" do
      category = Category.new(title: "Business")
      expect(category).to be_valid
    end
  end

  describe "relationships" do
    it "has many jobs" do
      category = Category.new(title: "Tech")
      expect(category).to respond_to(:jobs)
    end
  end
end
