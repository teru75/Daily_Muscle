class CreateGroupCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :group_customers do |t|
      t.references :customer, index: true, foreign_key: true
      t.references :group, index: true, foreign_key: true

      t.timestamps
    end
  end
end
