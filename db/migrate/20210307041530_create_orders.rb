class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :storeId
      t.string :externalCode
      t.string :subTotal
      t.string :deliveryFee
      t.float :total_shipping
      t.string :total
      t.string :country
      t.string :state
      t.string :city
      t.string :district
      t.string :street
      t.string :complement
      t.float :latitude
      t.float :longitude
      t.datetime :dtOrderCreate
      t.string :postalCode
      t.string :number
      t.references :customer, null: false, foreign_key: true
    end
  end
end
