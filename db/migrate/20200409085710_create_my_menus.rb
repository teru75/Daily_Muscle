class CreateMyMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :my_menus do |t|
      t.integer :customer_id
      t.string :theme
      t.integer :part
      t.timestamps
    end
  end
end
