class AddIsEnabledToEventTemplates < ActiveRecord::Migration[5.2]
  def change
    add_column :event_templates, :is_enabled, :boolean, default: true, null: false
  end
end
