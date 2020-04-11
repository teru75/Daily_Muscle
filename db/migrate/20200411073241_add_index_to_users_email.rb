class AddIndexToUsersEmail < ActiveRecord::Migration[5.2]
  def change
    add_index :customers, :emaail, unique: true
  end
end
