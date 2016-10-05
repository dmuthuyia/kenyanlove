class CreateProds < ActiveRecord::Migration
  def change
    create_table :prods do |t|
      t.string :name
      t.decimal :price, precision: 12, scale: 3
      t.boolean :active

      t.timestamps null: false
    end
  end
end
