class RemoveThemeFromMyMenu < ActiveRecord::Migration[5.2]
  def up
    remove_column :my_menus, :theme, :string
  end

  def down
    add_column :my_menus, :theme, :string
  end
end
