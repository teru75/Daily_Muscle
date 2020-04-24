class DropGroupsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :group_customers
  end
end
