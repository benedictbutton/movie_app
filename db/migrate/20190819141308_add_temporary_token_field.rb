class AddTemporaryTokenField < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :temporary_token, :string, default: nil
    add_index :users, :temporary_token
  end
end
