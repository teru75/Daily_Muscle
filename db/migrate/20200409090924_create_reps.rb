class CreateReps < ActiveRecord::Migration[5.2]
  def change
    create_table :reps do |t|
      t.integer :menu_id
      t.float :weight
      t.integer :count
      t.integer :set_count
      t.timestamps
    end
  end
end
