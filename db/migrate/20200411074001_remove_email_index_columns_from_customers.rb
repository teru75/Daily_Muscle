class RemoveEmailIndexColumnsFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :email, :index
  end
end
