class AddColumnToEventTemplates < ActiveRecord::Migration[5.2]
  def change
    add_column :event_templates, :theme, :string
  end
end
