class ChangeMoviesPosterName < ActiveRecord::Migration[5.1]
  def change
    rename_column :movies, :poster, :poster_path
  end
end
