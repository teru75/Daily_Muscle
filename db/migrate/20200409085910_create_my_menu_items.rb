class CreateMyMenuItems < ActiveRecord::Migration[5.2]
  def change
    create_table :my_menu_items do |t|
      t.integer :my_menu_id
      t.string :name
      t.timestamps
    end
  end
end
