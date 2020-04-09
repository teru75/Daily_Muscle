class CreateEventLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :event_likes do |t|
      t.integer :customer_id
      t.integer :event_id
      t.timestamps
    end
  end
end
