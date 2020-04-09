class CreateEventTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :event_templates do |t|
      t.integer :part
      t.timestamps
    end
  end
end
