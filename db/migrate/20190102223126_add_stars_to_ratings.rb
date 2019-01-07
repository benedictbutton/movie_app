class AddStarsToRatings < ActiveRecord::Migration[5.1]
  def change
    add_column :ratings, :stars, :string, array: true, default: []
  end
end
