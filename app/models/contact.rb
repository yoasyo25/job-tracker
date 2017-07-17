class Contact < ApplicationRecord
  validates :full_name, uniqueness: true
  validates :position, uniqueness: true
  validates :email, uniqueness: true

  belongs_to :company
end
