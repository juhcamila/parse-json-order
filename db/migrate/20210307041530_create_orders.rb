class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :storeId
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
      t.string :latitude
      t.string :longitude
      t.datetime :dtOrderCreate
      t.string :postalCode
      t.string :number
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
