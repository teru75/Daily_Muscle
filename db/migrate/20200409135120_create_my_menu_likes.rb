class CreateMyMenuLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :my_menu_likes do |t|
      t.integer :customer_id
      t.integer :my_menu_id
      t.timestamps
    end
  end
end
