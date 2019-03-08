class CreatePlaylists < ActiveRecord::Migration[5.1]
  def change
    create_table :playlists do |t|
      t.belongs_to :user, index: true
      t.string :name, null: false
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
