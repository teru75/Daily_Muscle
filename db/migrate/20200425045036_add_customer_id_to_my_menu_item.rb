class AddCustomerIdToMyMenuItem < ActiveRecord::Migration[5.2]
  def change
    add_column :my_menu_items, :customer_id, :integer
  end
end
