class RemoveStatusFromMenuTemplates < ActiveRecord::Migration[5.2]
  def change
  remove_column :menu_templates, :status, :boolean
  end
end
