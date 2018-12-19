class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.date :release_date
      t.string :poster
      t.text :description
      t.integer :vote_count, numericality: true, allow_nil: true
      t.decimal :vote_rating, numericality: true, precision: 5, scale: 2, allow_nil: true

      t.timestamps
    end
  end
end
