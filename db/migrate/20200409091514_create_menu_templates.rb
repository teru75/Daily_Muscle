class CreateMenuTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_templates do |t|
      t.integer :event_template_id
      t.string :name
      t.boolean :status, null: false, default: false
      t.timestamps
    end
  end
end
