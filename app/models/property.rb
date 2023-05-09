class Property < ApplicationRecord
  validates :price, numericality: true, presence: true
  validates :location, presence: true
  validates :status, presence: true, inclusion: { in: %w(active inactive) }
  validates :property_type, presence: true
  validates :description, presence: true

  belongs_to :seller
  belongs_to :buyer
end
