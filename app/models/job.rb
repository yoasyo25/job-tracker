class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, :category_id, presence: true
  belongs_to :company, optional: true
  belongs_to :category, optional: true
end
