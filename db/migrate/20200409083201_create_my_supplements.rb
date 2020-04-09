class CreateMySupplements < ActiveRecord::Migration[5.2]
  def change
    create_table :my_supplements do |t|
      t.integer :customer_id
      t.string :name
      t.integer :genre
      t.string :brand
      t.timestamps
    end
  end
end
