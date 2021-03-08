class Order < ApplicationRecord
  validates :storeId, :subTotal, :deliveryFee, :total_shipping, :total, :country, :state,
            :city, :district, :street, :complement, :latitude, :longitude, :dtOrderCreate,
            :postalCode, :number, :externalCode, presence: true

  belongs_to :customer, required: true
  has_many :items
  has_many :payments
end
