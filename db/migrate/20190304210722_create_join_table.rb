class CreateJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :playlists, :movies do |t|
      t.index [:playlist_id, :movie_id]
      t.index [:movie_id, :playlist_id]
    end
  end
end
