class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :customer_id
      t.datetime :start
      t.datetime :end
      t.integer :part
      t.timestamps
    end
  end
end
