class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.integer :quantity
      t.string :externalCode
      t.float :total
      t.references :order, null: false, foreign_key: true
    end
  end
end
