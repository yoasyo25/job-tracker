class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts


  def self.companies_by_interest
    interest = {}
    all.each do |company|
      interest[company.name] = company.jobs.count_of_jobs_by_level_of_interest
    end
    company_interest = interest.delete_if { |k, v| v.empty? }
  end

  def self.interest_in_companies_by_descending_order
    companies_by_interest.each do |key, value|
    companies_by_interest[key] = value.sort_by{ |key, value| value }
    end
  end
end
