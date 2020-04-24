class DropGroupCustomersTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :groups
  end
end
