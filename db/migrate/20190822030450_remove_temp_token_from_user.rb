class RemoveTempTokenFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_index :users, :temporary_token
    remove_column :users, :temporary_token, :string
  end
end
