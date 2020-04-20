class AddIntroductionToEventTemplates < ActiveRecord::Migration[5.2]
  def change
    add_column :event_templates, :introduction, :text
  end
end
