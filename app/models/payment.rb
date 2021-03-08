class Payment < ApplicationRecord
  validates :payment_type, :value, presence: true

  belongs_to :order, required: true
end
