class AddDetailsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_timestamps :users, null: false
  end
end
