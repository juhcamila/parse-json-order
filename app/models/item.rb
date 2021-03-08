class Item < ApplicationRecord
  validates :name, :price, :quantity, :total, :externalCode, presence: true

  belongs_to :order, required: true
end
