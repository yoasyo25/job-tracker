class Job < ApplicationRecord
  validates  :title, :level_of_interest, :city, :category_id, presence: true
  belongs_to :company, optional: true
  belongs_to :category, optional: true
  has_many   :comments

  def self.count_of_jobs_by_level_of_interest
    group(:level_of_interest).count
  end

  def self.level_of_interest_for_jobs
    pluck(:level_of_interest).uniq
  end

  def self.jobs_by_level_of_interest
    level_of_interest_for_jobs.map do |i|
      where(level_of_interest: i)
    end
  end

  def self.jobs_based_on_cities
    group(:city).count.sort_by(&:first)
  end

  def self.jobs_based_on_companies
    group(:company_id).count.sort_by(&:first)
  end

  def self.count_of_jobs_by_city
    group(:city).count
  end

  def find_cities
    pluck(:city).uniq
  end

  def self.jobs_by_city
    find_cities.map do |city|
      where(city: city)
    end
  end

  def self.jobs_for_a_city(location)
    where(city: location)
  end

  def self.find_companies
    pluck(:company_id).uniq
  end

  def self.jobs_by_company
    find_companies.map do |company|
      where(company_id: company)
    end
  end

  def self.top_three_companies_by_average_interest
    average_list = group(:company).average(:level_of_interest).sort_by(&:first)
    if average_list.count < 3
      average_list
    else
      average_list[0..2]
    end
  end

  def self.search(search)
    where("lower(title) LIKE ? OR lower(description) LIKE ?", "%#{search.downcase}", "%#{search.downcase}%")
  end

end
