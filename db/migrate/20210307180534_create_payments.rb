class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.string :payment_type
      t.float :value
      t.references :order, null: false, foreign_key: true
    end
  end
end
