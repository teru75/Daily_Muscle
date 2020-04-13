class ChangeDefaultColumnFromMenuTemplates < ActiveRecord::Migration[5.2]
  def change
    change_column_default :menu_templates, :status, from: false, to: true
  end
end
