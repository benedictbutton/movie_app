class AddMediaTypeToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :media_type, :string
  end
end
