class Customer < ApplicationRecord
  validates :name, :email, :contact, :externalCode, presence: true

  has_one :order
end
