class CreateMyGyms < ActiveRecord::Migration[5.2]
  def change
    create_table :my_gyms do |t|
      t.integer :customer_id
      t.string :name
      t.timestamps
    end
  end
end
