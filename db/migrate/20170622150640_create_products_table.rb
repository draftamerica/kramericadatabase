class CreateProductsTable < ActiveRecord::Migration[5.1]
  def change
      create_table :products do |t|
          t.string :prodname
          t.string :prodtype
          t.string :description
          t.float :listprice
      end
  end
end
