class Sale < ApplicationRecord
  belongs_to :product

  # You can add additional validations if necessary
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :total_price, presence: true, numericality: { greater_than_or_equal_to: 0.01 }
end
