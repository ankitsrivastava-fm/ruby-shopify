class Store < ApplicationRecord
  belongs_to :user
  has_one_attached :logo

  has_many :products, dependent: :destroy
end
