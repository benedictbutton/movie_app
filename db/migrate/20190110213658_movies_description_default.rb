class MoviesDescriptionDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default :movies, :description, " "
  end
end
