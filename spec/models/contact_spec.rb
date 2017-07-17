require 'rails_helper'

describe Contact do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a full name" do
        company = Company.new(name: "ESPN")
        contact = Contact.new(position: "Hiring Manager",
                              email:     "psantorini@example.com")
        expect(contact).to_not be_valid
      end

      it "has a unique name" do
        company = Company.create(name: "ESPN")
        contact = company.contacts.create(full_name: "Penelope Santorini",
                              position: "Hiring Manager",
                              email:     "psantorini@example.com")
        contact_2 = company.contacts.new(full_name: "Penelope Santorini",
                              position: "Hiring Manager",
                              email:     "psantorini@example.com")
        expect(contact_2).to be_invalid
      end

      it "is invalid without a position" do
        company = Company.new(name: "ESPN")
        contact = Contact.new(full_name: "Penelope Santorini",
                              email:     "psantorini@example.com")
        expect(contact).to_not be_valid
      end

      it "is invalid without an email address" do
        company = Company.new(name: "ESPN")
        contact = Contact.new(full_name: "Penelope Santorini",
                              position: "Hiring Manager")
        expect(contact).to_not be_valid
      end
    end

    context "valid attributes" do
      it "is valid with a full name, position, and email" do
        company = Company.new(name: "ESPN")
        contact = company.contacts.new(full_name: "Penelope Santorini",
                              position: "Hiring Manager",
                              email:     "psantorini@example.com")
        expect(contact).to be_valid
      end
    end
  end

  describe "relationship" do
    it "belongs to a company" do
      contact = Contact.new(full_name: "Penelope Santorini",
                          position: "Hiring Manager",
                          email:     "psantorini@example.com")
      expect(contact).to respond_to(:company)
    end
  end
end
