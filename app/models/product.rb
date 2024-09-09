class Product < ApplicationRecord
  belongs_to :store
  belongs_to :tenant

  has_one_attached :image

  # Validations
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :stock, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
