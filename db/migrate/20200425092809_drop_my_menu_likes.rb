class DropMyMenuLikes < ActiveRecord::Migration[5.2]
  def change
    drop_table :my_menu_likes do |t|
      t.integer :customer_id
      t.integer :my_menu_id
    end
  end
end
